import 'package:flutter/material.dart';
import 'Urun.dart';

class SepetModeli extends ChangeNotifier {
  final List<Urun> _sepettekiUrunler = [];

  List<Urun> get sepettekiUrunler => _sepettekiUrunler;

  // fiyat toplamak için yaptım
  double get genelToplam {
    double toplam = 0;
    for (var urun in _sepettekiUrunler) {
      toplam += urun.fiyat;
    }
    return toplam;
  }

  void sepeteEkle(Urun yeniUrun) {
    _sepettekiUrunler.add(yeniUrun);
    notifyListeners();
  }

  void urunuSil(Urun silinecekUrun) {
    _sepettekiUrunler.remove(silinecekUrun);
    notifyListeners();
  }

  void sepetiBosalt() {
    _sepettekiUrunler.clear();
    notifyListeners();
  }
}