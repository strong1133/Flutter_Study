import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/config/fatos_calendar.dart';

import './model/event.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;
  dynamic? ratio;

  MonthViewWidget({Key? key, this.state, this.width, this.ratio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MonthView<Event>(
      key: state,
      width: width,
      cellAspectRatio: this.ratio,
    );
  }
}
