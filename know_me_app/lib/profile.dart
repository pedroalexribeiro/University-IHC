import 'package:flutter/material.dart';
import 'package:know_me_app/home.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:know_me_app/waitingProfile.dart';

class Profile extends StatefulWidget {
  WebSocketChannel channel;

  Profile({this.channel});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isWritten = false;
  String input = "";
  bool _icon1 = false,
      _icon2 = false,
      _icon3 = false,
      _icon4 = false,
      _icon5 = false,
      _icon6 = false;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //Title of page
                child: Center(
                  child: Text(
                    'SELECT AN ICON',
                    style: TextStyle(
                        color: Color.fromRGBO(97, 97, 96, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                //Icons
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _selectIcon(1);
                            },
                            child: _icon1
                                ? KnowMeImage(
                                    'assets/images/icon1_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon1.png', 120, 120),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectIcon(2);
                            },
                            child: _icon2
                                ? KnowMeImage(
                                    'assets/images/icon2_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon2.png', 120, 120),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectIcon(3);
                            },
                            child: _icon3
                                ? KnowMeImage(
                                    'assets/images/icon3_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon3.png', 120, 120),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _selectIcon(4);
                            },
                            child: _icon4
                                ? KnowMeImage(
                                    'assets/images/icon4_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon4.png', 120, 120),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectIcon(5);
                            },
                            child: _icon5
                                ? KnowMeImage(
                                    'assets/images/icon5_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon5.png', 120, 120),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectIcon(6);
                            },
                            child: _icon6
                                ? KnowMeImage(
                                    'assets/images/icon6_grey.png', 120, 120)
                                : KnowMeImage(
                                    'assets/images/icon6.png', 120, 120),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //Insert name
                child: Center(
                  child: Container(
                    height: 40,
                    width: 220,
                    child: TextField(
                      onChanged: (value) {
                        if (value.length < 1) {
                          setState(() {
                            _isWritten = false;
                          });
                        } else {
                          setState(() {
                            input = value;
                            _isWritten = true;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromRGBO(107, 185, 108, 1),
                            width: 4.0,
                          )),
                          hintText: 'Insert Name'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(97, 97, 96, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                //Button
                child: Center(
                  child: MaterialButton(
                    child: Text(
                      'START',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color.fromRGBO(11, 153, 142, 1),
                    disabledColor: Color.fromRGBO(198, 198, 198, 1),
                    height: 40,
                    minWidth: 220,
                    elevation: 2,
                    onPressed:
                        (_isWritten && _checkState()) ? _startButton : null,
                  ),
                ),
              ),
              /*StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) _showDialog('Error', 'Stream error');
                    //If it is waiting
                    if (snapshot.connectionState == ConnectionState.waiting) ;

                    if (snapshot.hasData) {
                      //String s = convertFromJsonToString()
                      //if(s == valid) _redirect
                      //else _showDialog('Error', 'Invalid code, try again');
                    }

                    return;
                  }),*/
            ]),
      ),
    );
  }

  void _selectIcon(int iconNumber) {
    setState(() {
      _setIconsToFalse();

      switch (iconNumber) {
        case 1:
          _icon1 = true;
          break;
        case 2:
          _icon2 = true;
          break;
        case 3:
          _icon3 = true;
          break;
        case 4:
          _icon4 = true;
          break;
        case 5:
          _icon5 = true;
          break;
        case 6:
          _icon6 = true;
          break;
      }
    });
  }

  void _setIconsToFalse() {
    _icon1 = false;
    _icon2 = false;
    _icon3 = false;
    _icon4 = false;
    _icon5 = false;
    _icon6 = false;
  }

  bool _checkState() {
    return _icon1 || _icon2 || _icon3 || _icon4 || _icon5 || _icon6;
  }

  int _checkWhichState() {
    if (_icon1) return 1;
    if (_icon2) return 2;
    if (_icon3) return 3;
    if (_icon4) return 4;
    if (_icon5) return 5;
    if (_icon6) return 6;
    return 0;
  }

  void _startButton() {
    if (_isWritten && _checkState()) {
      /*widget.channel.sink
          .add("inputValue:{\"channel\":\"ChatMessagesChannel\"}");*/
      _redirect();
    }
  }

  void _showDialog(String title, String message) {
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

  void _redirect() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => WaitingProfile(
            channel: widget.channel, icon: _checkWhichState(), name: input)));
  }
}
