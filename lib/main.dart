import 'package:clockapp/Screens/alarm.dart';
import 'package:clockapp/Screens/clock.dart';
import 'package:clockapp/Screens/strapwatch.dart';
import 'package:clockapp/Screens/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AnalogClock(),
        '/alarm': (context) => const Alarm(),
        '/strap': (context) => const StrapWatch(),
        '/timer': (context) => const TimerScreen(),

      },
    );
  }
}
