import 'package:flutter/material.dart';
import 'package:simple_weather/constants.dart';
class WeatherPage extends StatelessWidget {
  const WeatherPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.navigate_before, color: Colors.white, size: 40,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          title: Text('LONDON, GB'),
        ),
        body: InfoWidget(),
      ),
    );
  }
}
class InfoWidget extends StatefulWidget {
  InfoWidget({Key key}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

  

class _InfoWidgetState extends State<InfoWidget> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

