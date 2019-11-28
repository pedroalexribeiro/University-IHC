import 'package:flutter/material.dart';
import 'package:know_me_app/answer.dart';
import 'package:know_me_app/home.dart';

import 'globalValues.dart';

class WaitingProfile extends StatelessWidget {
  final roomId;
  int icon;
  String name;
  var controller;
  var channel;

  WaitingProfile({this.roomId, this.icon, this.name});

  Widget build(BuildContext context) {
    controller = GlobalValues.of(context).controller;
    channel = GlobalValues.of(context).channel;

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
                    StreamBuilder(
                        stream: channel.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print("Error has occured");

                          if (snapshot.hasData) {
                            Map<String, String> map = snapshot.data;
                            String type = map[1];
                            List<String> colors = new List();
                            List<String> names = new List();
                            List<String> icons = new List();

                            switch (type) {
                              case "general":
                                map.forEach((key, value) {
                                  if (key != "type") {
                                    colors.add(value);
                                  }
                                });
                                break;
                              case "personal":
                                map.forEach((key, value) {
                                  if (key != "type") {
                                    names.add(key);
                                    icons.add(value);
                                  }
                                });
                                break;
                              default:
                                break;
                            }
                            print(snapshot.data);
                            _redirect(
                              context,
                              map.length,
                              type,
                              colors,
                              names,
                              icons,
                            );
                          }
                          return Container();
                        }),
                  ],
                )),
                Text(
                  'Waiting for other players',
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 96, 1),
                    fontSize: 15,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  void _redirect(BuildContext context, int length, String type,
      List<String> colors, List<String> names, List<String> icons) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Answer(
              roomId: roomId,
              ammountAnswers: length,
              questionType: type,
              colors: colors,
              names: names,
              icons: icons,
            )));
  }
}
