// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:class01/model/AirResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:class01/main.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('http 통신 테스트', () async {
    var base = "api.airvisual.com";
    var param = {'key': '7a2e226e-a693-4923-97e5-45de42255e53'};

    final uri = Uri.https(base, '/v2/nearest_city', param);
    var res = await http.get(uri);
    // print(res.body);
    AirResult airResult = AirResult.fromJson(json.decode(res.body));
    print(airResult);
    expect(airResult.status, 'success');
  });
}
