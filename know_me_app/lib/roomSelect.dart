import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/profile.dart';
import 'package:know_me_app/home.dart';

class RoomSelect extends StatefulWidget {
  final WebSocketChannel channel;

  RoomSelect({Key key, @required this.channel})
      : super(key: key);

  @override
  _RoomSelectState createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  bool _isWritten = false;
  String input = "";

  @override
  Widget build(BuildContext context) {
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
                        onPressed: (_isWritten) ? _redirect : null,
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot) {
                    print("connection state\n");
                    print(snapshot.connectionState);
                    if (snapshot.hasError) print("Error has occured");

                    if (snapshot.hasData) {
                      print("DATA\n");
                      //String s = convertFromJsonToString()
                      //if(s == valid) redirect to Profile
                      //else _showDialog('Error', 'Invalid code, try again');
                    } else if (!snapshot.hasData) {
                      print("NO DATA\n");
                    }

                    return Text("am i right?\n");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    String myJson = '{"command": "subscribe", "identifier": {"channel": "UserChannel"}}';

    if (_isWritten) {
      widget.channel.sink.add(myJson);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  void _redirect() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Profile(channel: widget.channel)));
  }
}
