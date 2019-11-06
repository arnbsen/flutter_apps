import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:simple_weather/geolocation_helper.dart';

const apiKey = '058867601e459e26790dafbcefc19e5f';

class WeatherAPIHelper {
  
  final _geolocator = GeoLocationHelper();

  Future<Map<String, dynamic>> getWeatherByName(String name) async {
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$name&appid=$apiKey');
    if (response.statusCode == 200) {
      var value = jsonDecode(response.body);
      return Future.value(value);
    } else {

      return Future.error('Oops! City not Found');
    }
  }

  Future<Map<String, dynamic>> getAutoDetectedLocationWeather() async {
    Position position = await _geolocator.getCurrentPosition();
    return this._getWeatherByLatAndLng(position.latitude, position.longitude);
  }

  Future<Map<String, dynamic>> _getWeatherByLatAndLng(double lat, double lng) async {
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$apiKey');
    
    if (response.statusCode == 200) {
      var value = jsonDecode(response.body);
      return Future.value(value);
    } else {
      
      return Future.error('Oops! Something bad happened');
    }
  }

}