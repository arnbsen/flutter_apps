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
                              style: TextStyle(
                                color: Color(0x99FFFFFF),
                                fontSize: 22.0
                              ),
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

