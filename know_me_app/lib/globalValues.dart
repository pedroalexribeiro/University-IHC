// GlobalValues.dart
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/io.dart';

class GlobalValues extends InheritedWidget {
  StreamController controller;
  IOWebSocketChannel channel;
  // Provider provider = new Provider(); * optional
  // TestBloc testbloc = TestBloc();
  // int counter = 0;  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  GlobalValues({Key key, Widget child}):
    super(key: key, child: child);


  static GlobalValues of(BuildContext context){
    return context.inheritFromWidgetOfExactType(GlobalValues) 
       as GlobalValues;
  }
}