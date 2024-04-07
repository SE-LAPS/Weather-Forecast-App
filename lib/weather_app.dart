import 'package:flutter/material.dart';
import 'weather_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      home: WeatherScreen(),
    );
  }
}