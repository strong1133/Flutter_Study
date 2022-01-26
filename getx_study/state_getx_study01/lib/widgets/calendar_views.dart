import 'dart:math';

import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../enumerations.dart';
import 'month_view_widget.dart';

class CalendarViews extends StatelessWidget {
  final CalendarView view;

  const CalendarViews({Key? key, this.view = CalendarView.month})
      : super(key: key);

  final _breakPoint = 1000.0;

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final width = min(_breakPoint, availableWidth);

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.red,
      child: Center(
          child: view == CalendarView.month
              ? MonthViewWidget(
                  width: width,
                )
              : MonthViewWidget(
                  width: width,
                )),
    );
  }
}
