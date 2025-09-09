import 'dart:io';
import 'dart:math';

// Kelas untuk menangani operasi matematika bangun datar dan ruang
class GeometriCalculator {
  // Bangun Datar
  static double luasPersegi(double sisi) => sisi * sisi;
  
  static double luasPersegiPanjang(double panjang, double lebar) => panjang * lebar;
  
  static double luasSegitiga(double alas, double tinggi) => 0.5 * alas * tinggi;
  
  static double luasLingkaran(double jariJari) => pi * jariJari * jariJari;
  
  // Bangun Ruang
  static double volumeKubus(double sisi) => sisi * sisi * sisi;
  
  static double volumeBalok(double panjang, double lebar, double tinggi) => panjang * lebar * tinggi;
  
  static double volumeTabung(double jariJari, double tinggi) => pi * jariJari * jariJari * tinggi;
  
  static double volumeBola(double jariJari) => (4 / 3) * pi * jariJari * jariJari * jariJari;
}

// Kelas untuk menangani input pengguna
class InputHandler {
  static double getDoubleInput(String prompt) {
    while (true) {
      try {
        print(prompt);
        var input = stdin.readLineSync();
        if (input == null || input.isEmpty) {
          print('Input tidak boleh kosong!');
          continue;
        }
        return double.parse(input);
      } catch (e) {
        print('Input tidak valid! Harap masukkan angka.');
      }
    }
  }
  
  static int getMenuInput(String prompt, int maxOption) {
    while (true) {
      try {
        print(prompt);
        var input = stdin.readLineSync();
        if (input == null || input.isEmpty) {
          print('Input tidak boleh kosong!');
          continue;
        }
        int choice = int.parse(input);
        if (choice >= 1 && choice <= maxOption) {
          return choice;
        } else {
          print('Pilihan tidak valid! Harap masukkan angka antara 1 dan $maxOption.');
        }
      } catch (e) {
        print('Input tidak valid! Harap masukkan angka.');
      }
    }
  }
}

// Kelas untuk menampilkan menu
class Menu {
  static final Map<int, String> mainMenu = {
    1: 'Luas Bangun Datar',
    2: 'Volume Bangun Ruang',
    3: 'Keluar'
  };
  
  static final Map<int, String> bangunDatarMenu = {
    1: 'Persegi',
    2: 'Persegi Panjang',
    3: 'Segitiga',
    4: 'Lingkaran',
    5: 'Kembali ke Menu Utama'
  };
  
  static final Map<int, String> bangunRuangMenu = {
    1: 'Kubus',
    2: 'Balok',
    3: 'Tabung',
    4: 'Bola',
    5: 'Kembali ke Menu Utama'
  };
  
  static void tampilkanMenu(Map<int, String> menu, String title) {
    print('\n=== $title ===');
    menu.forEach((key, value) => print('$key. $value'));
    print('Pilih opsi (1-${menu.length}): ');
  }
}

// Kelas untuk menangani logika aplikasi
class AplikasiKalkulator {
  static void jalankan() {
    bool running = true;
    
    while (running) {
      Menu.tampilkanMenu(Menu.mainMenu, 'KALKULATOR BANGUN DATAR & BANGUN RUANG');
      int pilihan = InputHandler.getMenuInput('', Menu.mainMenu.length);
      
      switch (pilihan) {
        case 1:
          _handleBangunDatar();
          break;
        case 2:
          _handleBangunRuang();
          break;
        case 3:
          print('Terima kasih telah menggunakan program ini!');
          running = false;
          break;
      }
    }
  }
  
  static void _handleBangunDatar() {
    bool kembali = false;
    
    while (!kembali) {
      Menu.tampilkanMenu(Menu.bangunDatarMenu, 'BANGUN DATAR');
      int pilihan = InputHandler.getMenuInput('', Menu.bangunDatarMenu.length);
      
      switch (pilihan) {
        case 1:
          double sisi = InputHandler.getDoubleInput('Masukkan panjang sisi: ');
          double hasil = GeometriCalculator.luasPersegi(sisi);
          print('Luas Persegi dengan sisi $sisi = $hasil');
          break;
        case 2:
          double panjang = InputHandler.getDoubleInput('Masukkan panjang: ');
          double lebar = InputHandler.getDoubleInput('Masukkan lebar: ');
          double hasil = GeometriCalculator.luasPersegiPanjang(panjang, lebar);
          print('Luas Persegi Panjang = $hasil');
          break;
        case 3:
          double alas = InputHandler.getDoubleInput('Masukkan alas: ');
          double tinggi = InputHandler.getDoubleInput('Masukkan tinggi: ');
          double hasil = GeometriCalculator.luasSegitiga(alas, tinggi);
          print('Luas Segitiga = $hasil');
          break;
        case 4:
          double jariJari = InputHandler.getDoubleInput('Masukkan jari-jari: ');
          double hasil = GeometriCalculator.luasLingkaran(jariJari);
          print('Luas Lingkaran = $hasil');
          break;
        case 5:
          kembali = true;
          break;
      }
    }
  }
  
  static void _handleBangunRuang() {
    bool kembali = false;
    
    while (!kembali) {
      Menu.tampilkanMenu(Menu.bangunRuangMenu, 'BANGUN RUANG');
      int pilihan = InputHandler.getMenuInput('', Menu.bangunRuangMenu.length);
      
      switch (pilihan) {
        case 1:
          double sisi = InputHandler.getDoubleInput('Masukkan panjang sisi: ');
          double hasil = GeometriCalculator.volumeKubus(sisi);
          print('Volume Kubus = $hasil');
          break;
        case 2:
          double panjang = InputHandler.getDoubleInput('Masukkan panjang: ');
          double lebar = InputHandler.getDoubleInput('Masukkan lebar: ');
          double tinggi = InputHandler.getDoubleInput('Masukkan tinggi: ');
          double hasil = GeometriCalculator.volumeBalok(panjang, lebar, tinggi);
          print('Volume Balok = $hasil');
          break;
        case 3:
          double jariJari = InputHandler.getDoubleInput('Masukkan jari-jari: ');
          double tinggi = InputHandler.getDoubleInput('Masukkan tinggi: ');
          double hasil = GeometriCalculator.volumeTabung(jariJari, tinggi);
          print('Volume Tabung = $hasil');
          break;
        case 4:
          double jariJari = InputHandler.getDoubleInput('Masukkan jari-jari: ');
          double hasil = GeometriCalculator.volumeBola(jariJari);
          print('Volume Bola = $hasil');
          break;
        case 5:
          kembali = true;
          break;
      }
    }
  }
}

void main() {
  AplikasiKalkulator.jalankan();
}