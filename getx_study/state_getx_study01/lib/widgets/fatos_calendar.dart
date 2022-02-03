import 'package:flutter/material.dart';
import 'package:state_getx_study01/widgets/calendar/create_calendar.dart';

class FatosCalender extends StatefulWidget {
  dynamic width;
  dynamic height;
  dynamic raito;

  FatosCalender(dynamic widthIn, dynamic heightIn, {dynamic ratioIn = 1}) {
    width = widthIn;
    height = heightIn;
    raito = ratioIn;
  }

  @override
  _FatosCalenderState createState() => _FatosCalenderState();
}

class _FatosCalenderState extends State<FatosCalender> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: widget.width,
          height: widget.height + 47,
          color: Colors.blue,
          child: Calendar(widget.width, widget.height, widget.raito)),
    );
  }
}
