import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_weather/data/my_location.dart';
import 'package:flutter_weather/screens/weather.dart';
import 'package:http/http.dart' as http;

const apiKey = 'd6322d621d3aad429abd8f86fc95ec49';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude2;
  double? longtitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurLocation();
    latitude2 = myLocation.latitude2;
    longtitude = myLocation.longtitude;
    print(myLocation.latitude2);
    _fetchData();
  }

  void _fetchData() async {
    final queryParameters = {
      'lat': '$latitude2',
      'lon': '$longtitude',
      'appid': apiKey,
      'units': 'metric'
    };
    const baseUrl = 'api.openweathermap.org';
    final uri = Uri.https(baseUrl, '/data/2.5/weather', queryParameters);
    print(uri);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonData = response.body;

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Weather(jsonData);
      }));
    } else {
      print('ERROR!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: const Text('Get My Location'),
        ),
      ),
    );
  }
}
