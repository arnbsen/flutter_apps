import 'package:bmi_calculator/model.dart';
import 'package:bmi_calculator/model.dart' as model;
import 'package:bmi_calculator/resuable_card.dart';
import 'package:bmi_calculator/result.dart';
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
  double heightVal = 120;
  int ageVal = 18;
  int weighValue = 20;

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

  void _onPressed() {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(
                bmi: model.BMICalculator(
                  age: ageVal,
                  gender: currentGender,
                  height: heightVal,
                  weight: weighValue
                )
                ,
              )
              ),
            );
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
                    icon: Icon(FontAwesomeIcons.venus, 
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
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                      'HEIGHT', 
                       style: Constants.getTextStyle(22.0),
                    ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text('$heightVal', 
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('cm',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0x99FFFFFF)
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0x99FFFFFF),
                      thumbColor: Color(0xFFc0392b),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0
                      )
                    ),
                    child: Slider(
                          min: 57,
                          max: 251,
                          value:  double.parse(this.heightVal.toStringAsFixed(1)),
                          onChanged: (double value) {
                            setState(() {
                              this.heightVal = double.parse(value.toStringAsFixed(1));
                            });
                          },
                        ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                )
              ],
            ),
            colour: Color(0xFF192a56),
          ),
          Expanded(
            flex: 30,
            child: Row(
              children: <Widget>[
                ResuableCard(
                  flex: 1,
                  child: OtherSelectors(
                    emitter: (int value) {
                      setState(() {
                        this.weighValue = value;
                      });
                    },
                    header: 'WEIGHT',
                    value: this.weighValue,
                  ),
                  colour: Color(0xFF192a56),
                ),
                ResuableCard(
                  flex: 1,
                  child: OtherSelectors(
                    emitter: (int val) {
                      setState(() {
                        this.ageVal = val;
                      });
                    },
                    header: 'AGE',
                    value: this.ageVal,
                  ),
                  colour: Color(0xFF192a56),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
               _onPressed();
            },
           
            child: Container(
               height: 85,
                width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFc0392b)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.topCenter,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          )
        ]
      ),
    );
  }
}
