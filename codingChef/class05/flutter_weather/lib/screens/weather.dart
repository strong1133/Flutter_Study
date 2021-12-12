import 'dart:convert';

import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  final parseWeatherData;
  Weather(this.parseWeatherData);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? cityName;
  int? temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    var weather = jsonDecode(weatherData)['weather'][0]['description'];
    cityName = jsonDecode(weatherData)['name'];
    double temp2 = jsonDecode(weatherData)['main']['temp'];
    temp = temp2.toInt();

    var wind = jsonDecode(weatherData)['wind']['speed'];
    var id = jsonDecode(weatherData)['id'];

    print(cityName);
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$cityName',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '$temp',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
