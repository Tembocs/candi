import 'package:flutter/material.dart';
import 'month_names.dart';
import 'years.dart';

class DaysView extends StatelessWidget {
  const DaysView({super.key});

  List<Widget> _buildCalendarDays(int year, int month) {
    List<Widget> dayWidgets = [];
    var daysInMonth = DateUtils.getDaysInMonth(year, month);

    // Correctly get the first day of the month using year and month from the widget
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    // Find out the weekday of the first day of the month
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    // Dart's DateTime class treats Monday as 1 and Sunday as 7,
    // If your calendar week starts on Sunday, adjust as shown below.
    // This will align the first day of the month with the correct day of the week.
    int blankDays = weekdayOfFirstDay - 1; // Adjust for a Sunday start

    // Add empty containers for days before the first day of the current month
    for (int i = 0; i < blankDays; i++) {
      dayWidgets.add(Container());
    }

    // Add days of the month
    for (int i = 1; i <= daysInMonth; i++) {
      dayWidgets.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            width: 400,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black, width: 10.0),
                top: BorderSide(color: Colors.black, width: 1.0),
                right: BorderSide(color: Colors.black, width: 1.0),
                bottom: BorderSide(color: Colors.black, width: 1.0),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            alignment: Alignment.topLeft,
            child: Text('$i'),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    // Return a list of days for year in years and month in month_names
    return ListView.builder(
      itemCount: years.length * month_names.length,
      itemBuilder: (BuildContext context, int index) {
        int year = years[index ~/ month_names.length];
        int month = index % month_names.length + 1;
        return Column(
          children: <Widget>[
            Text(
              '${month_names[month - 1]} $year',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            for (var item in _buildCalendarDays(year, month)) item,
          ],
        );
      },
    );
  }
}
