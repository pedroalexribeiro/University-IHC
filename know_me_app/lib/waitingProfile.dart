import 'dart:async';

import 'package:flutter/material.dart';
import 'package:know_me_app/answer.dart';
import 'package:know_me_app/profile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/home.dart';

class WaitingProfile extends StatelessWidget {
  WebSocketChannel channel;
  int icon;
  String name;

  WaitingProfile({this.channel, this.icon, this.name});

  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) => Answer(channel: channel)));
    });
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  children: [
                    KnowMeImage('assets/images/icon' + icon.toString() + '.png',
                        200, 250),
                    Text(
                      name,
                      style: TextStyle(
                          color: Color.fromRGBO(97, 97, 96, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Text(
                  'Waiting',
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 96, 1),
                    fontSize: 15,
                  ),
                  /*StreamBuilder(
                    stream: channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print('Error - Stream error');

                      if (snapshot.hasData) {
                        //String s = convertFromJsonToString()
                        //if(s == valid) _redirect(context)
                        //else _showDialog('Error', 'Invalid code, try again');
                      }

                      return;
                    }),*/
                ),
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
