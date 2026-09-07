import 'package:flutter/material.dart';
import '../models/kontak.dart';

// Halaman Tambah Kontak
// Berisi form (Nama Lengkap, Email, No. Handphone) dan tombol Simpan.
// Ketika Simpan ditekan, data kontak dikirim kembali ke Halaman Kontak
// menggunakan Navigator.pop(context, kontakBaru).
class TambahKontakPage extends StatefulWidget {
  const TambahKontakPage({super.key});

  @override
  State<TambahKontakPage> createState() => _TambahKontakPageState();
}

class _TambahKontakPageState extends State<TambahKontakPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  void _simpanKontak() {
    if (_formKey.currentState!.validate()) {
      final kontakBaru = Kontak(
        nama: _namaController.text.trim(),
        email: _emailController.text.trim(),
        noHp: _noHpController.text.trim(),
        kategori: _kategoriController.text.trim().isEmpty
            ? null
            : _kategoriController.text.trim(),
      );

      // Kirim data kontak baru kembali ke Halaman Kontak
      Navigator.pop(context, kontakBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _noHpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'No. Handphone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor handphone tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _kategoriController,
                decoration: const InputDecoration(
                  labelText: 'Kategori (opsional)',
                  hintText: 'Contoh: Keluarga, Teman, atau Kerja',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _simpanKontak,
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
