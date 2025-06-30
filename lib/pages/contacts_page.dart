import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {"name": "Abdellah Lambaraa", "email": "abdellah.lambaraa@gmail.com", "phone": "+212 600000001"},
      {"name": "Mohamed Lambaraa", "email": "mohamed.lambaraa@gmail.com", "phone": "+212 600000002"},
      {"name": "Omar Lambaraa", "email": "omar.lambaraa@gmail.com", "phone": "+212 600000003"},
      {"name": "Fatima Lambaraa", "email": "fatima.lambaraa@gmail.com", "phone": "+212 600000004"},
      {"name": "Yassir Lambaraa", "email": "yassir.lambaraa@gmail.com", "phone": "+212 600000005"},
      {"name": "Abdellah Lambaraa", "email": "abdellah.lambaraa@gmail.com", "phone": "+212 600000001"},
      {"name": "Mohamed Lambaraa", "email": "mohamed.lambaraa@gmail.com", "phone": "+212 600000002"},
      {"name": "Omar Lambaraa", "email": "omar.lambaraa@gmail.com", "phone": "+212 600000003"},
      {"name": "Fatima Lambaraa", "email": "fatima.lambaraa@gmail.com", "phone": "+212 600000004"},
      {"name": "Yassir Lambaraa", "email": "yassir.lambaraa@gmail.com", "phone": "+212 600000005"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("LAMBARAA Family Contacts")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepOrange.shade100,
                child: Text(
                  contact['name']![0],
                  style: const TextStyle(fontSize: 22, color: Colors.deepOrange),
                ),
              ),
              title: Text(contact['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(contact['email']!),
                  Text(contact['phone']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
