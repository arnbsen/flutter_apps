import 'package:flutter/material.dart';
class WeatherPage extends StatelessWidget {
  
  final Map<String, dynamic> weatherData;

  const WeatherPage({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1abc9c),
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
          title: Text( weatherData['name'] + ', ' +  weatherData['sys']['country']),
        ),
        body: InfoWidget(weatherData: this.weatherData,),
      ),
    );
  }
}
class InfoWidget extends StatefulWidget {

  final Map<String, dynamic> weatherData;

  InfoWidget({Key key, @required this.weatherData}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState(weatherData: this.weatherData);
}

  

class _InfoWidgetState extends State<InfoWidget> {

  Map<String, dynamic> weatherData;
  _InfoWidgetState({this.weatherData});

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
                 Text((weatherData['main']['temp'] - 273.15).toInt().toString())
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

