import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/home.dart';

class Waiting extends StatelessWidget {
  WebSocketChannel channel;
  int icon;
  String name;

  Waiting({this.channel, this.icon, this.name});

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              KnowMeImage(
                  'assets/images/icon' + icon.toString() + '.png', 130, 160),
              Text(name),
              Text('Waiting'),
              StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      _showDialog(context, 'Error', 'Stream error');
                    //If it is waiting
                    if (snapshot.connectionState == ConnectionState.waiting) ;

                    if (snapshot.hasData) {
                      //String s = convertFromJsonToString()
                      //if(s == valid) _redirect(context)
                      //else _showDialog('Error', 'Invalid code, try again');
                    }

                    return;
                  }),
            ]),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String message) {
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

  void _redirect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Waiting(channel: channel)));
  }
}
