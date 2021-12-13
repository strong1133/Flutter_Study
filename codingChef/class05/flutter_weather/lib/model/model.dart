import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    Widget icon = SvgPicture.asset(
      'svg/climacon-cloud_lightning.svg',
      color: Colors.black,
    );
    if (condition < 300) {
      icon = SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black,
      );
    } else if (condition < 600) {
      icon = SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black,
      );
    } else if (condition == 800) {
      icon = SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black,
      );
    } else if (condition <= 804) {
      icon = SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black,
      );
    }
    return icon;
  }
}
