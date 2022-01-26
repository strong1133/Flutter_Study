import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';
import 'calendar_views.dart';
import '../../widgets/calendar_views.dart';
import '../../enumerations.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarView _selectedView = CalendarView.month;

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
        controller: EventController(),
        child: Expanded(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
            ),
            child: CalendarViews(
              key: ValueKey(MediaQuery.of(context).size.width),
              view: _selectedView,
            ),
          ),
        ));
  }
}
