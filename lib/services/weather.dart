// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apiKey = "6126add668f3c1a3bd471c6f728a0248";
  // ignore: non_constant_identifier_names
  String APIURL = 'https://api.openweathermap.org/data/2.5/weather?';
  Future<dynamic> getCityWeather(var name) async {
    networkHelper net =
        networkHelper('${APIURL}q=$name&appid=$apiKey&units=metric');
    var weatherdata = await net.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    location loc = location();
    await loc.getCurrentLocation();

    networkHelper net = networkHelper(
        '${APIURL}lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await net.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
