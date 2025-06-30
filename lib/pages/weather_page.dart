import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> weatherData = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchWeather(String city) async {
    final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      setState(() {
        error = "API key not found in .env file.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      error = null;
      weatherData = [];
    });

    try {
      final uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric");

      final response = await http.get(uri);

      //print("Status: ${response.statusCode}");
      //print("Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List forecasts = data['list'];

        final List<Map<String, String>> filtered = forecasts
            .take(8) // prend les 8 premières prévisions (sur ~24h)
            .map<Map<String, String>>((item) => {
          "date": item['dt_txt'],
          "desc":
          "${item['weather'][0]['description']} - ${item['main']['temp']}°C"
        })
            .toList();

        setState(() {
          weatherData = filtered;
        });
      } else {
        setState(() {
          error = "City not found or API error.";
        });
      }
    } catch (e) {
      setState(() {
        error = "An error occurred: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Forecast")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  fetchWeather(_controller.text.trim());
                }
              },
              child: const Text("Get Weather"),
            ),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),
            if (error != null)
              Text(
                error!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            if (!isLoading && error == null && weatherData.isEmpty)
              const Text("No forecast data found."),
            if (!isLoading && error == null && weatherData.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: weatherData.length,
                  itemBuilder: (context, index) {
                    final item = weatherData[index];
                    return Card(
                      color: Colors.orange.shade100,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.cloud),
                        title: Text(item["date"]!),
                        subtitle: Text(item["desc"]!),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
