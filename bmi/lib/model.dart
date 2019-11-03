

import 'dart:math';

import 'package:flutter/material.dart';
enum Gender {
  male,
  female
}
class Constants {
  static TextStyle getTextStyle(double size) {
    return TextStyle(
        color: Color(0x99FFFFFF),
        fontSize: size
    );
  }
}

class BMICalculator {
  double height;
  int weight;
  int age;
  Gender gender;
  double bmiVal;

  BMICalculator({@required this.height, @required this.age, @required this.gender, @required this.weight}) {
    this.bmiVal = (this.weight / (pow(this.height / 100, 2)));
  }

  double calcBMI() {
    return this.bmiVal;
  }
  
  String typeInfo() {
    if (this.bmiVal < 15) {
      return 'VSU';
    } else if (this.bmiVal >= 15 && this.bmiVal < 16) {
      return 'SU';
    } else if (this.bmiVal >= 16 && this.bmiVal < 18.5) {
      return 'U';
    } else if (this.bmiVal >= 18.5 && this.bmiVal < 25) {
      return 'N';
    } else if (this.bmiVal >= 25 && this.bmiVal < 30) {
      return 'O';
    } else if (this.bmiVal >= 30 && this.bmiVal < 35) {
      return 'MO';
    } else if (this.bmiVal >= 35 && this.bmiVal < 40) {
      return 'SO';
    } else {
      return 'VSO';
    }


  }


}