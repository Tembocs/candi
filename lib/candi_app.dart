import 'package:flutter/material.dart';
import 'home_page.dart';

class CandiApp extends StatelessWidget {
  const CandiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
