import 'package:web_socket_channel/io.dart';

class Bloc{
  IOWebSocketChannel getChannel(){
    var channel = IOWebSocketChannel.connect('ws://192.168.1.72:3000/cable');
    return channel;
  }

  Stream getStream(IOWebSocketChannel channel){
    return channel.stream;
  }
}