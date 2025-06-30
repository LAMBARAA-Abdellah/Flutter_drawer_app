import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://picsum.photos/200?1',
      'https://picsum.photos/200?2',
      'https://picsum.photos/200?3',
      'https://picsum.photos/200?4',
      'https://picsum.photos/200?5',
      'https://picsum.photos/200?6',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Gallery")),
      body: GridView.count(
        crossAxisCount: 2,
        children: imageUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(url, fit: BoxFit.cover),
          );
        }).toList(),
      ),
    );
  }
}
