import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';

class RoomSelect extends StatefulWidget {
  WebSocketChannel channel;

  RoomSelect({
    Key key,
  }) : super(key: key);

  @override
  _RoomSelectState createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  var channel = IOWebSocketChannel.connect('ws://localhost:3000/cable');

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'Send message',
          child: Icon(Icons.send),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
