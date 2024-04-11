import 'package:flutter/material.dart';
import 'month_view/month_view.dart';
import 'month_view/month_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Calendar'),
      ),
      // body: const CustomCalendarWidget(),
      body: const MonthPages(),
    );
  }
}
