class Weather {
  final String cityName;
  final String temperature;
  final String generalCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.generalCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      generalCondition: json['weather'][0]['main'],
    );
  }
}
