// main.dart

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';
  String _errorMessage = ''; // Nueva variable para mensaje de error

  Future<void> _getWeatherData() async {
    String cityName = _cityController.text;
    cityName = toBeginningOfSentenceCase(cityName);
    String apiUrl = 'http://10.0.2.2:3001/weather?city=$cityName';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final data = json.decode(response.body);

      setState(() {
        _temperature = (data['temperature']).toStringAsFixed(2);
        _weatherCondition = data['weatherCondition'];
        _cityName = toBeginningOfSentenceCase(data['cityName']);
        _errorMessage = ''; // Limpiar el mensaje de error en caso de éxito
      });

      // Print the name of the city
      print('City Name: $_cityName');
    } catch (e) {
      setState(() {
        _errorMessage = 'City not found. Please enter a valid city name.';
      });
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 236, 244),
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 28, 49, 182),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Enter city name'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getWeatherData,
                child: const Text(
                  'Get Weather',
                  style: TextStyle(color: Color.fromRGBO(8, 7, 7, 0.894)),
                ),
              ),
              const SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Text(
                'City: $_cityName',
                style: const TextStyle(
                  color: Color.fromARGB(255, 28, 49, 182),
                ),
              ),
              Text(
                'Temperature: $_temperature °C',
                style: const TextStyle(
                  color: Color.fromARGB(255, 28, 49, 182),
                ),
              ),
              Text(
                'General Condition: $_weatherCondition',
                style: const TextStyle(
                  color: Color.fromARGB(255, 28, 49, 182),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
