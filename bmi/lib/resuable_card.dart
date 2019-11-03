import 'package:bmi_calculator/model.dart';
import 'package:flutter/material.dart';


class ResuableCard extends StatelessWidget {

  final Widget child;
  final Color colour;
  final int flex;
  const ResuableCard({@required this.child, @required this.colour, @required this.flex});

  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.flex,
      child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: this.colour,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: this.child,
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Icon icon;
  final String gender;
  final Color colour;
  const GenderCard({@required this.icon, @required this.gender, @required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: this.colour,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                  children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: SizedBox(),
                      ),
                      Expanded(
                          flex: 5,
                          child: this.icon,
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                              this.gender, 
                              style: Constants.getTextStyle(22.0),
                            ),
                        ),
                        Expanded(
                            flex: 2,
                            child: SizedBox(),
                        ),
                  ],
                ),
        );
  }
}
class OtherSelectors extends StatelessWidget {
  final String header;
  final int value;
  final Function emitter;

  const OtherSelectors({@required this.header, @required this.value, @required this.emitter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: Text(this.header, 
            style: Constants.getTextStyle(25.0),
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 35,
          child: Text('$value',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                heroTag: '$header' + 'plus',
                backgroundColor: Color(0xFF273c75),
                foregroundColor: Color(0x99FFFFFF),
                elevation: 0,
                onPressed: () {
                  this.emitter(value + 1);
                },
                child: Icon(Icons.add, size: 30),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                heroTag: '$header' + 'minus',
                backgroundColor: Color(0xFF273c75),
                foregroundColor: Color(0x99FFFFFF),
                elevation: 0,
                onPressed: () {
                  this.emitter(value - 1);
                },
                child: Icon(Icons.remove, size: 30,),
              )
            ],
          ),
        ),
        Expanded(
          flex: 15,
          child: SizedBox(),
        )
      ],
    );
  }
}

class ResultInfo extends StatelessWidget {

  final Map<String, Color> colorMap = {
    'VSU': Colors.orange,
    'SU': Colors.orange,
    'U': Colors.orange,
    'N': Colors.green,
    'O': Colors.orange,
    'MO': Colors.red,
    'SO': Colors.red,
    'VSO': Colors.red
  };
  final Map<String, String> fullFormMap = {
    'VSU': 'Very severely underweight',
    'SU': 'Severely underweight',
    'U': 'Underweight',
    'N': 'Normal',
    'O': 'Overweight',
    'MO' : 'Moderately obese',
    'SO': 'Severely obese',
    'VSO': 'Very severely obese'
  };
  final Map<String, String> messageMap = {
    'VSU': 'Eat More!',
    'SU': 'Eat More!',
    'U': 'Eat More!',
    'N': 'All Good!',
    'O': 'Eat Less!',
    'MO' : 'Eat Less!',
    'SO': 'Eat Less!',
    'VSO': 'Eat Less!'
  };

  final String type;
  final double bmiVal;

  ResultInfo({@required this.type, @required this.bmiVal});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(),
        Text(this.fullFormMap[this.type],
          style: TextStyle(
            color: this.colorMap[this.type],
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        Column(
          children: <Widget>[
            Text(
          'YOUR BMI IS',
          style: Constants.getTextStyle(25),
            ),
            Text('$bmiVal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        Text(this.messageMap[this.type],
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(),
      ],
    );
  }
}