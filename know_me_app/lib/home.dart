import 'package:flutter/material.dart';
import 'package:know_me_app/profile.dart';
import 'package:know_me_app/roomSelect.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (BuildContext context) => RoomSelect()));
      },
      child: Container(
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
              ]),
        ),
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
