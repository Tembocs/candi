import 'package:flutter/material.dart';
import 'month_names.dart';

class MonthView extends StatefulWidget {
  const MonthView({super.key, required this.month, required this.year});

  final int month;
  final int year;

  @override
  State createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  List<Widget> _buildCalendarDays() {
    List<Widget> dayWidgets = [];
    var daysInMonth = DateUtils.getDaysInMonth(widget.year, widget.month);

    // Correctly get the first day of the month using year and month from the widget
    DateTime firstDayOfMonth = DateTime(widget.year, widget.month, 1);
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
        Container(
          alignment: Alignment.center,
          child: Text('$i'),
        ),
      );
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    // Define the names of the days starting with Monday
    List<String> dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Generate widgets for the day names to display them
    List<Widget> dayNameWidgets = dayNames
        .map((name) => Expanded(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        Text(
          month_names[widget.month - 1],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dayNameWidgets,
        ),
        const SizedBox(
            height: 10), // Space between day names and calendar dates
        Expanded(
          child: GridView.count(
            crossAxisCount: 7, // 7 days in a week
            childAspectRatio:
                1.5, // You might want to adjust this based on your UI design
            mainAxisSpacing: 2, // Adjust the spacing as needed
            crossAxisSpacing: 2, // Adjust the spacing as needed
            children: _buildCalendarDays(),
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Text(month_names[widget.month - 1]),
  //       const SizedBox(height: 20),
  //       Expanded(
  //         child: GridView.count(
  //           crossAxisCount: 7, // 7 days in a week
  //           children: _buildCalendarDays(),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
