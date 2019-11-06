import 'package:flutter/material.dart';
import 'package:simple_weather/constants.dart';
class WeatherPage extends StatelessWidget {
  
  final Map<String, dynamic> weatherData;

  const WeatherPage({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: WeatherFactory.colorMap[weatherData['weather'][0]['icon']]
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: WeatherFactory.colorMap[weatherData['weather'][0]['icon']],
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
          title: Text( weatherData['name'].toUpperCase() + ', ' +  weatherData['sys']['country'].toUpperCase(),
            style: GlobalStyles.getTextStyle(20, Colors.white, FontWeight.bold),
          ),
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WeatherFactory.iconProvider[weatherData['weather'][0]['icon']], 
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  Text((weatherData['main']['temp'] - 273.15).toInt().toString(),
                      style: GlobalStyles.getTextStyle(80, Colors.white, FontWeight.bold),
                  ),
                  SizedBox(width: 10,),
                  Text('°',
                    style: GlobalStyles.getTextStyle(30, Colors.white, FontWeight.bold),
                  ),
                  Text('C',
                     style: GlobalStyles.getTextStyle(30, Colors.white, FontWeight.bold),
                  )
                ],
              ),
            
              Text(weatherData['weather'][0]['main'].toUpperCase(),
                style: GlobalStyles.getTextStyle(20, Colors.white, FontWeight.w400),
              ),
              Text(weatherData['weather'][0]['description'].toUpperCase(),
                style: GlobalStyles.getTextStyle(20, Colors.white, FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('MIN: ',
                    style: GlobalStyles.getTextStyle(25, Colors.white, FontWeight.w400),
                  ),
                  Text((weatherData['main']['temp_min'] - 273.15).toInt().toString(),
                      style: GlobalStyles.getTextStyle(25, Colors.white, FontWeight.w400),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  
                   Text('MAX: ',
                    style: GlobalStyles.getTextStyle(25, Colors.white, FontWeight.w400),
                  ),
                  Text((weatherData['main']['temp_max'] - 273.15).toInt().toString(),
                      style: GlobalStyles.getTextStyle(25, Colors.white, FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

