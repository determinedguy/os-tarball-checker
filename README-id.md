# os-tarball-checker

> **LAST REVISION**: `REV05 Sun 21 Nov 2021 19:00:00 WIB`

Sebuah skrip sederhana untuk mengecek nilai mingguan mata kuliah Sistem Operasi (OS).

> Copyright (C) 2021 Muhammad Athallah, Fawzan Fawzi

## Changelog

### REV05
- Mengubah semua di README menjadi bahasa inggris.
- Menyederhanakan bagian tata cara penggunaan.
- Menambahkan beberapa opsi.
- Menambahkan suatu pengecekan agar pengguna tidak perlu mengunduh ulang tarball lagi setiap saat pengguna ingin melihat nilai minggu lain. Pengecekan ini dapat diabaikan menggunakan opsi `-r`. 

### REV04
- Mengubah masukan nama akun pengguna menjadi otomatis (menggunakan skrip `$USER`).

### REV03
- Mengubah nama skrip menjadi `tarball-checker.sh`.
- Mengubah tujuan direktori file tarball menjadi `/tmp/tarball-checker`, sehingga tidak mengotori direktori pengguna dan menambah fleksibilitas lokasi penempatan skrip (dapat ditaruh di folder mana saja, tidak harus dalam `$HOME/tarball-grade`).
- Mengubah masukan nama akun pengguna menjadi masukan interaktif (tidak _hard-coded_).

### REV02
- Mengubah masukan minggu yang ingin dicek menjadi masukan interaktif (tidak _hard-coded_).

## Tata Cara Penggunaan

1. Klon repository ini ke dalam VM anda.
    ```
    git clone https://github.com/determinedguy/os-tarball-checker
    ```
2. cd ke `os-tarball-checker` dan jalankan skrip `tarball-checker.sh` dengan menggunakan perintah sebagai berikut: 
    ```
    ./tarball-checker.sh
    ```
3. Masukkan minggu yang ingin dicek detail nilainya (misalkan minggu ke-6, maka masukannya adalah `6` atau `06`).
4. Voila! Nilaimu akan keluar diikuti dengan _benchmark_ pada minggu tersebut.
5. Untuk mengupdate nilai anda untuk minggu selanjutnya, tambahkan opsi `-r`.
    ```
    ./grade.sh -r
    ```

## Lisensi

Kode `tarball-checker.sh` memiliki lisensi [AGPL-3.0 License](LICENSE).
