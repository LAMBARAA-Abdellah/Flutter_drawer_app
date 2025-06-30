import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // 👈 pour charger .env
import 'pages/home_page.dart';
import 'pages/counter_page.dart';
import 'pages/contacts_page.dart';
import 'pages/weather_page.dart';
import 'pages/gallery_page.dart';
import 'pages/quiz_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔐 Charger .env AVANT runApp()
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("❌ .env loading failed: $e");
  }

  runApp(const NewDrawerApp());
}

class NewDrawerApp extends StatelessWidget {
  const NewDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/quiz': (_) => const QuizPage(),
        '/counter': (_) => const CounterPage(),
        '/contacts': (_) => const ContactsPage(),
        '/weather': (_) => const WeatherPage(),
        '/gallery': (_) => const GalleryPage(),
      },
    );
  }
}
