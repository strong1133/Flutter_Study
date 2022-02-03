import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/config/fatos_calendar.dart';

import './model/event.dart';
import './calendar_views.dart';
import './enumerations.dart';

class Calendar extends StatefulWidget {
  dynamic width;
  dynamic height;

  Calendar(this.width, this.height, {Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarView _selectedView = CalendarView.month;

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
      controller: EventController(),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          size: Size(widget.width, widget.height),
        ),
        child: CalendarViews(
          key: ValueKey(MediaQuery.of(context).size.width),
          view: _selectedView,
        ),
      ),
    );
  }
}
