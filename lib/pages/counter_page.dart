import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Text("Counter Value => $counter", style: const TextStyle(fontSize: 20)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () => setState(() => counter--), child: const Icon(Icons.remove)),
          const SizedBox(width: 10),
          FloatingActionButton(onPressed: () => setState(() => counter++), child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
