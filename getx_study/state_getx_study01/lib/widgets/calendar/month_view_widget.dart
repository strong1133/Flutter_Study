import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/config/fatos_calendar.dart';

import './model/event.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;
  dynamic? ratio;

  EventController eventController;
  final event = CalendarEventData(
    date: DateTime(2022, 2, 10),
    event: "Event 1",
    title: 'asd',
  );

  MonthViewWidget({Key? key, this.state, this.width, this.ratio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    eventController.add(event);
    return MonthView<Event>(
      onCellTap: (events, date) => {print("events  $events =  |  date  $date")},
      key: state,
      width: width,
      cellAspectRatio: this.ratio,
    );
  }
}
