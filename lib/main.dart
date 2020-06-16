import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static AudioCache player = AudioCache();

  Widget myTone(Color myColor, int myNumber) {
    return Expanded(
      child: FlatButton(
          color: myColor,
          onPressed: () {
            setState(() {
              player.play('note$myNumber.wav');
            });
          },
          child: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('piano game'),
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              myTone(Colors.red, 1),
              myTone(Colors.orange, 2),
              myTone(Colors.yellowAccent, 3),
              myTone(Colors.green, 4),
              myTone(Colors.purple, 5),
              myTone(Colors.pinkAccent, 6),
              myTone(Colors.blueGrey, 7),
            ],
          ),
        ),
      ),
    );
  }
}
