import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
    _fetchData();
  }

  void _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('position: $position');
    } catch (e) {
      print('에러!');
    }
  }

  void _fetchData() async {
    final queryParameters = {
      'q': 'London',
      'appid': 'b1b15e88fa797225412429c1c50c122a1',
    };
    const baseUrl = 'samples.openweathermap.org';
    final uri = Uri.https(baseUrl, '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    String jsonData = response.body;
    var weather = jsonDecode(jsonData)['weather'][0]['description'];
    var wind = jsonDecode(jsonData)['wind']['speed'];
    var id = jsonDecode(jsonData)['id'];
    print('$weather, $wind, $id');
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
