import 'dart:convert';
import 'package:flutter_weather/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Weather extends StatefulWidget {
  final parseWeatherData;
  Weather(this.parseWeatherData);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Model model = Model();
  Widget icon = SvgPicture.asset(
    'svg/climacon-cloud_lightning.svg',
    color: Colors.black,
  );
  String? cityName;
  int? temp;
  String? des;
  var date = DateTime.now();

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

    int condition = jsonDecode(weatherData)['weather'][0]['id'];
    icon = model.getWeatherIcon(condition);

    des = jsonDecode(weatherData)['weather'][0]['description'];
    print(jsonDecode(weatherData)['weather']);
    var wind = jsonDecode(weatherData)['wind']['speed'];
    var id = jsonDecode(weatherData)['id'];

    print(cityName);
    print(temp);
  }

  String getSysTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // 기본적으로 AppBar영역과 body영역이 구분되어 있지만, 해당 옵션을 주면 body영역이 AppBar영역과 동일한 지점에서 시작된다.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$cityName',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    print('${getSysTime()}');
                                    return Text('${getSysTime()}',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white));
                                  },
                                ),
                                Text(DateFormat(' - EEEE').format(date),
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(DateFormat(' - d MMM, yyy').format(date),
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: TextStyle(
                                  fontSize: 75.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('$des',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('AQI(대기질지수)',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Image.asset(
                                'image/bad.png',
                                width: 37.0,
                                height: 35.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('매우나쁨',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('미세먼지',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('174.2',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('/m3',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('초미세먼지',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('84.4',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('/m3',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
