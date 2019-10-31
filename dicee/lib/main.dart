import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(Dicee());

class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiceContainer(),
    );
  }
}
class DiceContainer extends StatelessWidget {
  // Contains the code that do not need to be repainted everytime
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicee'),
      ),
      backgroundColor: Colors.red,
      body: DiceArea()
      
    );
  }
}
class DiceArea extends StatefulWidget {
  // Contains the code that needs to be repainted everytime
  DiceArea({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _DiceAreaState createState() => _DiceAreaState();
}

class _DiceAreaState extends State<DiceArea> {
  static var random = new Random();
  int leftdiceNumber = random.nextInt(6) + 1;
  int rightdiceNumber = random.nextInt(6) + 1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    leftdiceNumber = random.nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$leftdiceNumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    rightdiceNumber = random.nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$rightdiceNumber.png'),
              ),
            )
          ],
        ),
      );
  }
}
