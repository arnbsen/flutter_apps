import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  void playSound(int songNo) {
    player.play('note$songNo.wav');
  }

  Expanded playButton({int keyNo, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(keyNo);
        },
        child: null,
        color: color,
      ),
    );
  }

  static var colorArray = [null, Colors.red, Colors.orange,  Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple];

  List<Widget> createButtons() {
    var widgetArray = List<Widget>();
    for (var i = 1; i <= 7; i++) {
      widgetArray.add(playButton(color: colorArray[i], keyNo: i));
    }
    return widgetArray;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createButtons(),
          ),
        ),
      ),
    );
  }
}
