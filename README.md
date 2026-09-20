# my_first_app

Aplikasi katalog layanan (beranda + detail) yang dibangun dengan Flutter.

## Persyaratan

- [Flutter SDK](https://docs.flutter.dev/get-started/install) versi 3.13 atau lebih baru
- Dart SDK `^3.13.0`
- Editor (disarankan VS Code) atau terminal/command prompt

## Menjalankan Project

1. Buka terminal di root folder project.

2. Instal dependency:

   ```bash
   flutter pub get
   ```

3. Cek kesiapan perangkat/emulator, pastikan ada perangkat yang terhubung:

   ```bash
   flutter devices
   ```

4. Jalankan aplikasi (pilih salah satu):

   - Menjalankan ke perangkat/emulator yang tersedia:

     ```bash
     flutter run
     ```

   - Menjalankan di browser:

     ```bash
     flutter run -d chrome
     ```

   - Menjalankan di perangkat tertentu menggunakan device id:

     ```bash
     flutter run -d <device_id>
     ```

   - Membuat build production (APK Android):

     ```bash
     flutter build apk --release
     ```

5. Setelah `flutter run` berhasil, hot reload bisa dilakukan dengan menekan `r` di terminal, dan hot restart dengan `R`.

## Menjalankan Test

```bash
flutter test
```

## Struktur Folder

```
lib/
├── main.dart                  # Entry point aplikasi
├── models/
│   └── service_model.dart     # Model Service dan data layanan
├── screens/
│   ├── home_screen.dart       # Screen 1 (Beranda) - StatelessWidget
│   └── detail_screen.dart     # Screen 2 (Detail Katalog) - StatefulWidget
└── widgets/
    ├── page_header.dart       # Komponen judul halaman
    ├── product_card.dart      # Card produk yang bisa diklik
    └── search_bar.dart        # Komponen pencarian
```

## Alur Aplikasi

- **Beranda**: menampilkan daftar 3 layanan dalam `ListView`. Setiap card dapat diklik.
- **Navigasi**: klik kartu akan memanggil `Navigator.push` menuju Detail Katalog.
- **Detail Katalog**: menampilkan gambar, nama, harga, rating, deskripsi (dalam container pastel), dan tombol "Pesan Sekarang".