// Model sederhana untuk satu data kontak
class Kontak {
  final String nama;
  final String email;
  final String noHp;
  String? kategori;

  String get inisialNamaDepan {
    final namaBersih = nama.trim();
    return namaBersih.isNotEmpty ? namaBersih[0].toUpperCase() : '?';
  }

  Kontak({
    required this.nama,
    required this.email,
    required this.noHp,
    this.kategori,
  });
}
