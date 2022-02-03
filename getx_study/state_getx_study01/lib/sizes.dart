import 'package:flutter/material.dart';

/// Header의 기본 가로 길이 : 화면의 가로 길이
double defaultHeaderWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Header의 기본 세로 길이 : 화면의 세로 길이의 5%
double defaultHeaderHeight(BuildContext context) {
  return MediaQuery.of(context).size.height * .05;
}

/// Sidebar의 기본 가로 길이 : 화면의 가로 길이의 5%
double defaultSidebarWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * .05;
}

/// Sidebar의 기본 세로 길이 : 화면의 세로 길이
double defaultSidebarHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
