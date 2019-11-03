import 'package:bmi_calculator/model.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF192a56),
        scaffoldBackgroundColor: Color(0xFF273c75)
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender currentGender;

  void changeGender(Gender nextGender) {
    if (this.currentGender == null) {
      this.currentGender = nextGender;
      return;
    }
    if (this.currentGender == nextGender) {
      this.currentGender = null;
    } else {
      this.currentGender = nextGender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 30,
            child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeGender(Gender.male);
                    });
                  },
                  child: GenderCard(
                    gender: 'MALE', 
                    colour: Color(currentGender == Gender.male ? 0xFF121F45: 0xFF192a56),
                    icon: Icon(FontAwesomeIcons.mars, 
                        size: 80.0, color: 
                        Colors.white,
                        ),
                    ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeGender(Gender.female);
                    });
                  },
                  child: GenderCard(
                    gender: 'FEMALE', 
                    colour: Color(currentGender == Gender.female ? 0xFF121F45: 0xFF192a56),
                    icon: Icon(FontAwesomeIcons.mars, 
                        size: 80.0, color: 
                        Colors.white,
                        ),
                    ),
                ),
              ),
            ]
            ),
          ),
          ResuableCard(
            flex: 30,
            child: null,
            colour: Color(0xFF192a56),
          ),
          Expanded(
            flex: 30,
            child: Row(
              children: <Widget>[
                ResuableCard(
                  flex: 1,
                  child: null,
                  colour: Color(0xFF192a56),
                ),
                ResuableCard(
                  flex: 1,
                  child: null,
                  colour: Color(0xFF192a56),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 85,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFFc0392b)
            ),
          )
        ]
      ),
    );
  }
}
