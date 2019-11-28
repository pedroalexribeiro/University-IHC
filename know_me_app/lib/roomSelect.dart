import 'package:flutter/material.dart';
import 'package:know_me_app/globalValues.dart';
import 'package:know_me_app/profile.dart';
import 'package:know_me_app/home.dart';
import 'dart:convert';

class RoomSelect extends StatefulWidget {
  RoomSelect({Key key}) : super(key: key);

  @override
  _RoomSelectState createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  bool _isWritten = false;
  String input = "";
  var controller;
  var channel;

  @override
  Widget build(BuildContext context) {
    controller = GlobalValues.of(context).controller;
    channel = GlobalValues.of(context).channel;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.3, 0.7],
          colors: [
            Color.fromRGBO(107, 185, 108, 1),
            Color.fromRGBO(11, 153, 142, 1),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KnowMeImage('assets/images/logo.png', 130, 160),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 40,
                      width: 220,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length < 1) {
                            setState(() {
                              _isWritten = false;
                            });
                          } else {
                            setState(() {
                              input = value;
                              _isWritten = true;
                            });
                          }
                        },
                        decoration:
                            InputDecoration(hintText: 'Insert Room Code'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(97, 97, 96, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        child: Text(
                          'START',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        disabledColor: Color.fromRGBO(198, 198, 198, 1),
                        height: 40,
                        minWidth: 220,
                        elevation: 2,
                        onPressed: (_isWritten) ? _sendMessage : null,
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                  stream: controller.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("Error has occured");

                    if (snapshot.hasData) {
                      print("Room Select -> Has data\n");
                      var myJson = {
                        "command": "subscribe",
                        "identifier": "{\"channel\":\"GameChannel\"}"
                      };
                      channel.sink.add(jsonEncode(myJson));

                      print(snapshot.data);
                      Map<String, dynamic> map = jsonDecode(snapshot.data);
                      print('Howdy, ${map['message']}!');

                      if (!(map['message'] is int)) {
                        Map<String, dynamic> answer =
                            jsonDecode(map['message']);
                        print('PLEASE BE GOOD TO ME ${answer['room']}!');
                        if (answer['room']) return _redirect();
                      }
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_isWritten) {
      var roomCode = {
        "command": "message",
        "identifier": "{\"channel\":\"UserChannel\"}",
        "data":
            "{\"action\": \"check_game_room\", \"args\": \"{\\\"code\\\": \\\"" +
                input +
                "\\\"}\"}"
      };

      channel.sink.add(jsonEncode(roomCode));
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Widget _redirect() {
    return new Profile(roomId: input);
  }
}
