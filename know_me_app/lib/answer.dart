import 'package:flutter/material.dart';
import 'package:know_me_app/profile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Answer extends StatelessWidget {
  WebSocketChannel channel;

  Answer({this.channel});

  Widget build(BuildContext context) {
    return StreamBuilder(
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
        });
  }

  Widget _answers() {
    return Container(
      child: Scaffold(
        body: Row(),
      ),
    );
  }

  void _redirect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => Profile(channel: channel)));
  }
}
