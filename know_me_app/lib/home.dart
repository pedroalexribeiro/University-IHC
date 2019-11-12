import 'package:flutter/material.dart';
import 'package:know_me_app/profile.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              KnowMeImage('assets/images/logo.png', 130, 160),
              Container(
                child: Center(
                  child: Button('Start Game'),
                ),
              ),
            ]),
      ),
    );
  }
}

class KnowMeImage extends StatelessWidget {
  final String _path;
  final double _width;
  final double _height;
  KnowMeImage(this._path, this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(5.0),
      child: Image.asset(
        _path,
        width: _width,
        height: _height,
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String _text;
  Button(this._text);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(
          _text,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        height: 40,
        minWidth: 220,
        elevation: 2,
        color: Colors.white,
        textColor: Color.fromRGBO(97, 97, 96, 1),
        onPressed: () {
          //Use`Navigator` widget to push the second screen to out stack of screens
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new Profile();
          }));
        });
  }
}
