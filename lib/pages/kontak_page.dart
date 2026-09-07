import 'package:flutter/material.dart';
import '../models/kontak.dart';

// Halaman Kontak
// Menampilkan daftar kontak (Nama, Email, Nomor Handphone).
// Daftar kontak & fungsi hapus dikirim dari BerandaPage agar datanya
// tetap sama walau berpindah tab.
class KontakPage extends StatelessWidget {
  final List<Kontak> daftarKontak;
  final void Function(int index) onHapus;

  const KontakPage({
    super.key,
    required this.daftarKontak,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    if (daftarKontak.isEmpty) {
      return const Center(
        child: Text('Belum ada kontak. Tekan tombol (+) untuk menambah.'),  
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: daftarKontak.length,
      itemBuilder: (context, index) {
        final kontak = daftarKontak[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(kontak.inisialNamaDepan),
            ),
            title: Text(kontak.nama),
            subtitle: Text('${kontak.email}\n${kontak.noHp}'),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onHapus(index),
            ),
          ),
        );
      },
    );
  }
}
