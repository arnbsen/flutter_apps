import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: 'Magic 8 Ball',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: Magic8BallContainer(),
      ),
);
class Magic8BallContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Magic8Ball(),
      )
    );
  }
}

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  static var random = new Random();
  int imageNo = random.nextInt(5) + 1;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          imageNo = random.nextInt(5) + 1;
        });
      },
      child: Image.asset('images/ball$imageNo.png'),
    );
  }
}