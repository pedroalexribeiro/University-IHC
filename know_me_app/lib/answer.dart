import 'package:flutter/material.dart';
import 'package:know_me_app/home.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Answer extends StatelessWidget {
  //Responder com Resposta e ID (vou ter de passar para baixo)
  final WebSocketChannel channel;

  int ammountAnswers = 0;
  String questionType = "";
  List<String> colors = new List();
  List<String> names = new List();
  List<String> icons = new List();
  int nCard = 0;

  Answer(
      {this.channel,
      this.questionType,
      this.ammountAnswers,
      this.colors,
      this.names,
      this.icons});

  Color translateColor(String string) {
    switch (string) {
      case "red":
        return Colors.red;
        break;
      case "green":
        return Colors.green;
        break;
      case "yellow":
        return Colors.yellow;
        break;
      case "blue":
        return Colors.blue;
        break;

      default:
        return Colors.black;
    }
  }

  Widget build(BuildContext context) {
    return _answers(context, ammountAnswers, questionType);
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
    //nCard++;
    switch (typeAnswers) {
      case "general":
        Color c = translateColor(colors[nCard]);
        nCard++;
        //Falta escolher a cor com base do que vem do WebSocket
        return GestureDetector(
          onTap: () {
            print("here0\n");
          },
          child: Card(
            color: c,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
        break;
      case "personal":
        String name = names[nCard];
        String icon = icons[nCard];
        nCard++;
        return GestureDetector(
          onTap: () {
            print("here1\n");
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
                KnowMeImage('assets/images/icon' + icon + '.png', 120, 140),
                Text(
                  name,
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
