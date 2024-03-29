import 'package:flutter/material.dart';

import 'package:simple_weather/weather_api_helper.dart';
import 'package:simple_weather/weather_page.dart';
import 'constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1abc9c),
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF2c3e50)
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  
  final _weatherApiHelper = WeatherAPIHelper();

  bool _showLoader = false;

  String _cityName;

  void _showErrorDialog(String err) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('Error'),
          content: Text(err),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CLOSE'),
            )
          ],
        );
      }
    );
  }


  void _onPressedAutoDetect() async {
    setState(() {
      this._showLoader = true;
    });
    _weatherApiHelper.getAutoDetectedLocationWeather().then((value) {
        setState(() {
            this._showLoader = false;
        });
        Navigator.push(context, 
              MaterialPageRoute(
              builder: (context) => WeatherPage(weatherData: value,)
            )
          );
      }
    ).catchError((err) {
      setState(() {
            this._showLoader = false;
          });
      this._showErrorDialog(err.toString());
    });
  }

  void _onPressedByName() async {
      setState(() {
        this._showLoader = true;
      });
      _weatherApiHelper.getWeatherByName(this._cityName).then((value) {
           setState(() {
            this._showLoader = false;
          });
        Navigator.push(context, 
              MaterialPageRoute(
              builder: (context) => WeatherPage(weatherData: value,)
            )
          );
      }).catchError((err) {
        setState(() {
            this._showLoader = false;
          });
        this._showErrorDialog(err.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.wb_sunny, color: Colors.yellow, size: 60,),
                Text('Simple Weather',
                  style: GlobalStyles.getTextStyle(35, Colors.white, FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  color: Colors.white,
                  onPressed: () {  
                      _onPressedAutoDetect();
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.navigation, size: 25, color: Color(0xFF1abc9c),),
                      SizedBox(width: 10,),
                      Text('Auto Detect Location', 
                        style: GlobalStyles.getTextStyle(20, Color(0xFF1abc9c), FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('OR',
                  style: GlobalStyles.getTextStyle(20, Colors.white, FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  cursorColor: Color(0xFF1abc9c),
                  style: GlobalStyles.getTextStyle(20, Color(0xFF1abc9c), FontWeight.w300),
                  enabled: !_showLoader,
                  onChanged: (value) {
                    this._cityName = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Enter your location',
                  ),
                ),
                SizedBox(height: 15,),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _onPressedByName();
                    });
                  },
                  color: Color(0xFF16a085),
                  child: Container(
                    width: 78,
                    color: Color(0xFF16a085),
                    child: Row(
                      children: <Widget>[

                        Text('GO',
                          style: GlobalStyles.getTextStyle(25, Colors.white, FontWeight.bold),
                        ),
                        SizedBox(width: 2,),
                        Icon(Icons.navigate_next, color: Colors.white, size: 40,)
                      ],
                    ),
                  )
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: this._showLoader,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.yellow
                  ),
                )
              ],
            ),
        ),
      )
    );
  }
}
