import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {"name": "Saad El Mabrouk", "email": "saad.elmab@xcloud.com", "phone": "+212 612345678"},
      {"name": "Kylian Mbappe", "email": "k.mbappe@realmadrid.com", "phone": "+34 623456789"},
      {"name": "Fede Valverdi", "email": "f.valverdi@xexample.com", "phone": "+34 654321000"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(contact['name']![0])),
            title: Text(contact['name']!),
            subtitle: Text("${contact['email']} • ${contact['phone']}"),
          );
        },
      ),
    );
  }
}
