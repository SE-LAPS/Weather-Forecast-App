class WeatherData {
  final String name;
  final MainData main;
  final List<WeatherDescription> weather;

  WeatherData({
    required this.name,
    required this.main,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final mainData = MainData.fromJson(json['main']);
    final weatherList = List<WeatherDescription>.from(
      json['weather'].map((x) => WeatherDescription.fromJson(x)),
    );

    return WeatherData(
      name: json['name'],
      main: mainData,
      weather: weatherList,
    );
  }
}

class MainData {
  final double temp;

  MainData({required this.temp});

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
      temp: json['temp'].toDouble(),
    );
  }
}

class WeatherDescription {
  final String description;

  WeatherDescription({required this.description});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      description: json['description'],
    );
  }
}