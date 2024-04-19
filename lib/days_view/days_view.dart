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
      dayWidgets.add(Container()); // Empty container for alignment
    }

    // Add days of the month
    for (int i = 1; i <= daysInMonth; i++) {
      dayWidgets.add(
        SizedBox(
          height: 120,
          width: 220,
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            alignment: Alignment.center,
            child: Text('$i'),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    // REturn a list of days for year in years and month in month_names
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
            // GridView.count(
            //   crossAxisCount: 7,
            //   shrinkWrap: true,
            //   children: _buildCalendarDays(year, month),
            // ),
          ],
        );
      },
    );
  }
}
