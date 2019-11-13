import 'package:flutter/material.dart';
import 'package:know_me_app/profile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/home.dart';

class WaitingProfile extends StatelessWidget {
  WebSocketChannel channel;
  int icon;
  String name;

  WaitingProfile({this.channel, this.icon, this.name});

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KnowMeImage(
                    'assets/images/icon' + icon.toString() + '.png', 130, 160),
                Text(name),
                Text('Waiting'),
                StreamBuilder(
                    stream: channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print('Error - Stream error');

                      if (snapshot.hasData) {
                        //String s = convertFromJsonToString()
                        //if(s == valid) _redirect(context)
                        //else _showDialog('Error', 'Invalid code, try again');
                      }

                      return;
                    }),
              ]),
        ),
      ),
    );
  }

  void _redirect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Profile(channel: channel)));
  }
}
