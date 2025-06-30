import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Counter'),
              onTap: () => Navigator.pushNamed(context, '/counter'),
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contacts'),
              onTap: () => Navigator.pushNamed(context, '/contacts'),
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text('Weather'),
              onTap: () => Navigator.pushNamed(context, '/weather'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: const Text('Gallery'),
              onTap: () => Navigator.pushNamed(context, '/gallery'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Welcome to II-BDCC app with Drawer"),
      ),
    );
  }
}
