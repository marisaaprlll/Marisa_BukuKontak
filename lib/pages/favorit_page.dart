import 'package:flutter/material.dart';

// Halaman Favorit
// Menampilkan data diri sebagai kontak favorit
class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.person, size: 40, color: Colors.grey),
          title: const Text(
            'Rosyidah Alif Hakimah',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('kyliaa19@gmail.com\n085123637230'),
          isThreeLine: true,
        ),
      ),
    ); // Padding
  }
}