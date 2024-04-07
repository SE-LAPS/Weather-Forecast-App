import 'package:flutter/material.dart';
import 'api_client.dart';
import 'models/weather_data.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherData? _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    final weatherData = await ApiClient.fetchWeatherData('New York');
    setState(() {
      _weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Center(
        child: _weatherData == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location: ${_weatherData!.name}',
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Temperature: ${_weatherData!.main.temp}°C',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Description: ${_weatherData!.weather.first.description}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
      ),
    );
  }
}