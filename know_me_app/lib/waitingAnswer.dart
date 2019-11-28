import 'dart:async';

import 'package:flutter/material.dart';
import 'package:know_me_app/profile.dart';

import 'globalValues.dart';

class WaitingAnswer extends StatelessWidget {
  Color color;
  var controller;
  var channel;

  WaitingAnswer({this.color});

  Widget build(BuildContext context) {
    controller = GlobalValues.of(context).controller;
    channel = GlobalValues.of(context).channel;
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 200,
                  child: Card(
                    color: color,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
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
        builder: (BuildContext context) => Profile()));
  }
}
