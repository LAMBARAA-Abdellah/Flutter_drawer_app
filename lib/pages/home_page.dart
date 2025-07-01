import 'package:flutter/material.dart';
import '../widgets/mydrawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("II-BDCC")),
      drawer: const MyDrawerWidget(),
      body: const Center(child: Text("Welcome to the Drawer App")),
    );
  }
}
