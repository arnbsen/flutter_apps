import 'package:bmi_calculator/model.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final BMICalculator bmi;

  ResultPage({@required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ResuableCard(
            flex: 15,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text('Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold 
                  ),
              ),
            ),
            colour: Color(0xFF192a56),
          ),
          ResuableCard(
            flex: 75,
            colour: Color(0xFF192a56),
            child: ResultInfo(
              bmiVal: double.parse(this.bmi.calcBMI().toStringAsFixed(2)),
              type: this.bmi.typeInfo(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFc0392b) 
              ),
              child: Text(
                'RE CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      )
    );
  }
}