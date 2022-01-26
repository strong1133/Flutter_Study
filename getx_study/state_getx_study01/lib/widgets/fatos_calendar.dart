import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/create_calendar.dart';

class FatosCalender extends StatefulWidget {
  const FatosCalender({Key? key}) : super(key: key);

  @override
  _FatosCalenderState createState() => _FatosCalenderState();
}

class _FatosCalenderState extends State<FatosCalender> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 500, height: 500, color: Colors.blue, child: const Calendar()),
    );
  }
}
