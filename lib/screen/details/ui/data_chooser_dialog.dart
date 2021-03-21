import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker>{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {
              print(dateTime);
            }));
  }
}
