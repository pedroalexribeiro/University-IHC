import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/profile.dart';

class RoomSelect extends StatefulWidget {
  WebSocketChannel channel;

  @override
  _RoomSelectState createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  bool _isWritten = false;
  String input = "";
  var channel = null; //IOWebSocketChannel.connect('ws://localhost:3000/cable');

  TextEditingController _controller = TextEditingController();

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
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
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    )),
                    hintText: 'Insert Code'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(97, 97, 96, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //Button
              child: Center(
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
                  color: Color.fromRGBO(11, 153, 142, 1),
                  disabledColor: Color.fromRGBO(198, 198, 198, 1),
                  height: 40,
                  minWidth: 220,
                  elevation: 2,
                  onPressed: (_isWritten) ? _sendMessage : null,
                ),
              ),
            ),
            /*StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) _showDialog('Error', 'Stream error');
                  //If it is waiting
                  if (snapshot.connectionState == ConnectionState.waiting) ;

                  if (snapshot.hasData) {
                    //String s = convertFromJsonToString()
                    //if(s == valid) redirect to Profile
                    //else _showDialog('Error', 'Invalid code, try again');
                  }

                  return;
                }),*/
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_isWritten) {
      widget.channel.sink
          .add("inputValue:{\"channel\":\"ChatMessagesChannel\"}");
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _redirect() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Profile(channel: channel)));
  }
}
