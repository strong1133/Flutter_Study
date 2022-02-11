import 'dart:math';

import 'package:flutter/material.dart';

import './app_colors.dart';
import './enumerations.dart';
import 'month_view_widget.dart';

class CalendarViews extends StatelessWidget {
  final CalendarView view;
  dynamic ratio;

  CalendarViews({Key? key, this.view = CalendarView.month, this.ratio})
      : super(key: key);

  final _breakPoint = 5500.0;

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final width = min(_breakPoint, availableWidth);

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
          child: view == CalendarView.month
              ? MonthViewWidget(
                  width: width,
                  ratio: this.ratio,
                )
              : MonthViewWidget(
                  width: width,
                  ratio: this.ratio,
                )),
    );
  }
}
