import 'package:flutter/material.dart';
import '../models/kontak.dart';

// Halaman Kontak
// Menampilkan daftar kontak (Nama, Email, Nomor Handphone).
// Daftar kontak & fungsi hapus dikirim dari BerandaPage agar datanya
// tetap sama walau berpindah tab.
class KontakPage extends StatelessWidget {
  final List<Kontak> daftarKontak;
  final void Function(int index) onHapus;
  final Stream<String> searchStream;
  final ValueChanged<String> onSearchChanged;

  const KontakPage({
    super.key,
    required this.daftarKontak,
    required this.onHapus,
    required this.searchStream,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Cari kontak',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: onSearchChanged,
          ),
        ),
        Expanded(
          child: StreamBuilder<String>(
            stream: searchStream,
            initialData: '',
            builder: (context, snapshot) {
              final kataKunci = (snapshot.data ?? '').toLowerCase();
              final kontakTersaring = daftarKontak.where((kontak) {
                final nama = kontak.nama.toLowerCase();
                final email = kontak.email.toLowerCase();
                final noHp = kontak.noHp.toLowerCase();
                final kategori = (kontak.kategori ?? '').toLowerCase();
                return nama.contains(kataKunci) ||
                    email.contains(kataKunci) ||
                    noHp.contains(kataKunci) ||
                    kategori.contains(kataKunci);
              }).toList();

              if (kontakTersaring.isEmpty) {
                return Center(
                  child: Text(
                    daftarKontak.isEmpty
                        ? 'Belum ada kontak. Tekan tombol (+) untuk menambah.'
                        : 'Kontak tidak ditemukan.',
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: kontakTersaring.length,
                itemBuilder: (context, index) {
                  final kontak = kontakTersaring[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(kontak.inisialNamaDepan),
                      ),
                      title: Text(kontak.nama),
                      subtitle: Text(
                        '${kontak.email}\n${kontak.noHp}\n${kontak.kategori ?? 'Tanpa kategori'}',
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => onHapus(daftarKontak.indexOf(kontak)),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
