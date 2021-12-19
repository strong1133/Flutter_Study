import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _getData() async {
    const baseUrl = 'localhost:3700';
    final uri = Uri.http(baseUrl, '/mvt/ocean');
    print(uri);

    final response = await http.post(uri, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    print(response);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      print(jsonData);
    } else {
      print('ERROR!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _getData();
          },
          child: const Text('Get My Mvt'),
        ),
      ),
    );
  }
}
