import 'package:flutter/material.dart';
import 'package:know_me_app/home.dart';
import 'package:know_me_app/waitingAnswer.dart';
import 'package:know_me_app/waitingProfile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Answer extends StatelessWidget {
  final WebSocketChannel channel;

  int nCard = 0;

  Answer({this.channel});

  Widget build(BuildContext context) {
    /*return StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
          //If it is waiting
          if (snapshot.connectionState == ConnectionState.waiting) ;

          if (snapshot.hasData) {
            //String s = convertFromJsonToString()
            // From the String will provide Type of Question -> Implied type of Answers
            //makeAnswers()

          }

          return;
        });*/
    return _answers(context, 6, "general");
  }

  Widget _answers(BuildContext context, int numberAnswers, String typeAnswers) {
    bool cmp(int i, int j) {
      // If impar and condition -> false

      if ((numberAnswers % 2 != 0) && (i + j == numberAnswers)) return false;
      return true;
    }

    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          children: [
            for (int i = 0; i < numberAnswers; i += 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < 2 && cmp(i, j); j++)
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 180,
                          child: _card(context, typeAnswers),
                        ),
                      ],
                    )
                ],
              )
          ],
        ),
      ),
    );
  }

  GestureDetector _card(BuildContext context, String typeAnswers) {
    //list<Cores>.get(nCard);
    //list<Name>.get(nCard);
    //list<Icon>.get(nCard);
    //nCard++;
    switch (typeAnswers) {
      case "general":
        //Falta escolher a cor com base do que vem do WebSocket
        return GestureDetector(
          onTap: () {
            print("here0\n");
            Navigator.of(context).push(MaterialPageRoute<Null>(
                builder: (BuildContext context) =>
                    WaitingAnswer(channel: channel, color: Colors.green)));
          },
          child: Card(
            color: Colors.green,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
        break;
      case "personal":
        return GestureDetector(
          onTap: () {
            print("here1\n");
            Navigator.of(context).push(MaterialPageRoute<Null>(
                builder: (BuildContext context) => WaitingProfile(
                    channel: channel, icon: 1, name: 'Name Here')));
          },
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                child: Column(
              children: [
                //Falta escolher icon/name de acordo com que vem do Websocket
                KnowMeImage('assets/images/icon1.png', 120, 140),
                Text(
                  'Name Here',
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 96, 1),
                    fontSize: 15,
                  ),
                ),
              ],
            )),
          ),
        );
        break;
      default:
        return null;
    }
  }
}
