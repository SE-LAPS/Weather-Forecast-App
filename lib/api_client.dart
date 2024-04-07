import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'models/weather_data.dart';

class ApiClient {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey = 'YOUR_API_KEY';

  static Future<WeatherData> fetchWeatherData(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}