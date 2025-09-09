import 'dart:io';
import 'dart:math';

// Abstract class untuk Bangun Datar
abstract class BangunDatar {
  double hitungLuas();
  void tampilkanInfo();
}

// Abstract class untuk Bangun Ruang
abstract class BangunRuang {
  double hitungVolume();
  void tampilkanInfo();
}

// Class Persegi
class Persegi implements BangunDatar {
  double sisi;
  
  Persegi(this.sisi);
  
  @override
  double hitungLuas() {
    return sisi * sisi;
  }
  
  @override
  void tampilkanInfo() {
    print('Persegi dengan sisi: $sisi');
    print('Luas: ${hitungLuas()}');
  }
}

// Class Persegi Panjang
class PersegiPanjang implements BangunDatar {
  double panjang;
  double lebar;
  
  PersegiPanjang(this.panjang, this.lebar);
  
  @override
  double hitungLuas() {
    return panjang * lebar;
  }
  
  @override
  void tampilkanInfo() {
    print('Persegi Panjang dengan panjang: $panjang, lebar: $lebar');
    print('Luas: ${hitungLuas()}');
  }
}

// Class Segitiga
class Segitiga implements BangunDatar {
  double alas;
  double tinggi;
  
  Segitiga(this.alas, this.tinggi);
  
  @override
  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
  
  @override
  void tampilkanInfo() {
    print('Segitiga dengan alas: $alas, tinggi: $tinggi');
    print('Luas: ${hitungLuas()}');
  }
}

// Class Lingkaran
class Lingkaran implements BangunDatar {
  double jariJari;
  
  Lingkaran(this.jariJari);
  
  @override
  double hitungLuas() {
    return pi * jariJari * jariJari;
  }
  
  @override
  void tampilkanInfo() {
    print('Lingkaran dengan jari-jari: $jariJari');
    print('Luas: ${hitungLuas().toStringAsFixed(2)}');
  }
}

// Class Kubus
class Kubus implements BangunRuang {
  double sisi;
  
  Kubus(this.sisi);
  
  @override
  double hitungVolume() {
    return sisi * sisi * sisi;
  }
  
  @override
  void tampilkanInfo() {
    print('Kubus dengan sisi: $sisi');
    print('Volume: ${hitungVolume()}');
  }
}

// Class Balok
class Balok implements BangunRuang {
  double panjang;
  double lebar;
  double tinggi;
  
  Balok(this.panjang, this.lebar, this.tinggi);
  
  @override
  double hitungVolume() {
    return panjang * lebar * tinggi;
  }
  
  @override
  void tampilkanInfo() {
    print('Balok dengan panjang: $panjang, lebar: $lebar, tinggi: $tinggi');
    print('Volume: ${hitungVolume()}');
  }
}

// Class Tabung
class Tabung implements BangunRuang {
  double jariJari;
  double tinggi;
  
  Tabung(this.jariJari, this.tinggi);
  
  @override
  double hitungVolume() {
    return pi * jariJari * jariJari * tinggi;
  }
  
  @override
  void tampilkanInfo() {
    print('Tabung dengan jari-jari: $jariJari, tinggi: $tinggi');
    print('Volume: ${hitungVolume().toStringAsFixed(2)}');
  }
}

// Class Bola
class Bola implements BangunRuang {
  double jariJari;
  
  Bola(this.jariJari);
  
  @override
  double hitungVolume() {
    return (4 / 3) * pi * jariJari * jariJari * jariJari;
  }
  
  @override
  void tampilkanInfo() {
    print('Bola dengan jari-jari: $jariJari');
    print('Volume: ${hitungVolume().toStringAsFixed(2)}');
  }
}

// Class untuk menangani menu dan input
class KalkulatorGeometri {
  void tampilkanMenuUtama() {
    print('\n=== KALKULATOR BANGUN DATAR & BANGUN RUANG ===');
    print('1. Luas Bangun Datar');
    print('2. Volume Bangun Ruang');
    print('3. Keluar');
    print('Pilih menu (1-3): ');
  }
  
  void tampilkanMenuBangunDatar() {
    print('\n=== BANGUN DATAR ===');
    print('1. Persegi');
    print('2. Persegi Panjang');
    print('3. Segitiga');
    print('4. Lingkaran');
    print('5. Kembali ke Menu Utama');
    print('Pilih bangun datar (1-5): ');
  }
  
  void tampilkanMenuBangunRuang() {
    print('\n=== BANGUN RUANG ===');
    print('1. Kubus');
    print('2. Balok');
    print('3. Tabung');
    print('4. Bola');
    print('5. Kembali ke Menu Utama');
    print('Pilih bangun ruang (1-5): ');
  }
  
  void jalankan() {
    bool running = true;
    
    while (running) {
      tampilkanMenuUtama();
      var pilihan = stdin.readLineSync();
      
      switch (pilihan) {
        case '1':
          _handleBangunDatar();
          break;
          
        case '2':
          _handleBangunRuang();
          break;
          
        case '3':
          print('\nTerima kasih telah menggunakan program!');
          running = false;
          break;
          
        default:
          print('Pilihan tidak valid! Silakan pilih 1-3.');
      }
    }
  }
  
  void _handleBangunDatar() {
    bool kembali = false;
    
    while (!kembali) {
      tampilkanMenuBangunDatar();
      var pilihan = stdin.readLineSync();
      
      switch (pilihan) {
        case '1':
          _hitungPersegi();
          break;
          
        case '2':
          _hitungPersegiPanjang();
          break;
          
        case '3':
          _hitungSegitiga();
          break;
          
        case '4':
          _hitungLingkaran();
          break;
          
        case '5':
          kembali = true;
          break;
          
        default:
          print('Pilihan tidak valid!');
      }
    }
  }
  
  void _handleBangunRuang() {
    bool kembali = false;
    
    while (!kembali) {
      tampilkanMenuBangunRuang();
      var pilihan = stdin.readLineSync();
      
      switch (pilihan) {
        case '1':
          _hitungKubus();
          break;
          
        case '2':
          _hitungBalok();
          break;
          
        case '3':
          _hitungTabung();
          break;
          
        case '4':
          _hitungBola();
          break;
          
        case '5':
          kembali = true;
          break;
          
        default:
          print('Pilihan tidak valid!');
      }
    }
  }
  
  void _hitungPersegi() {
    print('Masukkan panjang sisi: ');
    double sisi = double.parse(stdin.readLineSync()!);
    Persegi persegi = Persegi(sisi);
    persegi.tampilkanInfo();
  }
  
  void _hitungPersegiPanjang() {
    print('Masukkan panjang: ');
    double panjang = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar: ');
    double lebar = double.parse(stdin.readLineSync()!);
    PersegiPanjang persegiPanjang = PersegiPanjang(panjang, lebar);
    persegiPanjang.tampilkanInfo();
  }
  
  void _hitungSegitiga() {
    print('Masukkan alas: ');
    double alas = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi: ');
    double tinggi = double.parse(stdin.readLineSync()!);
    Segitiga segitiga = Segitiga(alas, tinggi);
    segitiga.tampilkanInfo();
  }
  
  void _hitungLingkaran() {
    print('Masukkan jari-jari: ');
    double jariJari = double.parse(stdin.readLineSync()!);
    Lingkaran lingkaran = Lingkaran(jariJari);
    lingkaran.tampilkanInfo();
  }
  
  void _hitungKubus() {
    print('Masukkan panjang sisi: ');
    double sisi = double.parse(stdin.readLineSync()!);
    Kubus kubus = Kubus(sisi);
    kubus.tampilkanInfo();
  }
  
  void _hitungBalok() {
    print('Masukkan panjang: ');
    double panjang = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar: ');
    double lebar = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi: ');
    double tinggi = double.parse(stdin.readLineSync()!);
    Balok balok = Balok(panjang, lebar, tinggi);
    balok.tampilkanInfo();
  }
  
  void _hitungTabung() {
    print('Masukkan jari-jari: ');
    double jariJari = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi: ');
    double tinggi = double.parse(stdin.readLineSync()!);
    Tabung tabung = Tabung(jariJari, tinggi);
    tabung.tampilkanInfo();
  }
  
  void _hitungBola() {
    print('Masukkan jari-jari: ');
    double jariJari = double.parse(stdin.readLineSync()!);
    Bola bola = Bola(jariJari);
    bola.tampilkanInfo();
  }
}

void main() {
  KalkulatorGeometri kalkulator = KalkulatorGeometri();
  kalkulator.jalankan();
}