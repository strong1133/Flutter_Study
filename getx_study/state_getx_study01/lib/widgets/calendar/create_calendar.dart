import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/config/fatos_calendar.dart';

import './model/event.dart';
import './calendar_views.dart';
import './enumerations.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

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
          size: Size(500, 500),
        ),
        child: CalendarViews(
          key: ValueKey(MediaQuery.of(context).size.width),
          view: _selectedView,
        ),
      ),
    );
  }
}


// @override
//   Widget build(BuildContext context) {
//     return CalendarControllerProvider<Event>(
//       controller: EventController(),
//       child: MediaQuery(
//         data: MediaQuery.of(context).copyWith(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//         ),
//         child: CalendarViews(
//           key: ValueKey(MediaQuery.of(context).size.width),
//           view: _selectedView,
//         ),
//       ),
//     );
//   }
