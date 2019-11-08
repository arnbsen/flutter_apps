import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GlobalStyles {
  static TextStyle getTextStyle(double value, Color color, FontWeight weight) {
    return TextStyle(
      color: color == null ? Colors.white: color,
      fontSize: value == null? 15 : value,
      fontWeight: weight
    );
  }
}
class WeatherFactory {
  static Map<String, Icon> iconProvider = {
        "01d": Icon(Icons.brightness_high, size: 80, color: Colors.yellow,),
        "01n": Icon(Icons.brightness_3, size: 80, color: Colors.white,),
        "02d": Icon(FontAwesomeIcons.cloudSun, size: 80, color: Colors.white,),
        "02n": Icon(FontAwesomeIcons.cloudSun, size: 80, color: Colors.white,),
        "03n": Icon(Icons.cloud, size: 80, color: Colors.white,),
        "03d": Icon(Icons.cloud, size: 80, color: Colors.white,),
        "04n": Icon(Icons.cloud, size: 80, color: Colors.white,),
        "04d": Icon(Icons.cloud, size: 80, color: Colors.white,),
        "09n": Icon(FontAwesomeIcons.cloudShowersHeavy, size: 80, color: Colors.white,),
        "09d": Icon(FontAwesomeIcons.cloudShowersHeavy, size: 80, color: Colors.white,),
        "10n": Icon(FontAwesomeIcons.cloudMoonRain, size: 80, color: Colors.white,),
        "10d": Icon(FontAwesomeIcons.cloudSunRain, size: 80, color: Colors.white,),
        "11n": Icon(FontAwesomeIcons.pooStorm, size: 80, color: Colors.white,),
        "11d": Icon(FontAwesomeIcons.pooStorm, size: 80, color: Colors.white,),
        "13n": Icon(Icons.ac_unit, size: 80, color: Colors.white,),
        "13d": Icon(Icons.ac_unit, size: 80, color: Colors.white,),
        "50n": Icon(FontAwesomeIcons.smog, size: 80, color: Colors.white,),
        "50d": Icon(FontAwesomeIcons.smog, size: 80, color: Colors.white,),
  };

  static Map<String, Color> colorMap = {
        "01d": Color(0xFF3498db),
        "01n": Color(0xFF34495e),
        "02d": Color(0xFF3498db),
        "02n": Color(0xFF34495e),
        "03n": Color(0xFF2c3e50),
        "03d": Color(0xFF95a5a6),
        "04n": Color(0xFF2c3e50),
        "04d": Color(0xFF95a5a6),
        "09n": Color(0xFF2c3e50),
        "09d": Color(0xFF95a5a6),
        "10n": Color(0xFF2c3e50),
        "10d": Color(0xFF95a5a6),
        "11n": Color(0xFF2c3e50),
        "11d": Color(0xFF95a5a6),
        "13n": Color(0xFF34495e),
        "13d": Color(0xFF3498db),
        "50n": Color(0xFF2c3e50),
        "50d": Color(0xFF3498db),
  };
}