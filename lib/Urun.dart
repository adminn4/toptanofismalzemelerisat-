import 'package:flutter/material.dart';

class Urun {
  final String ad;
  final String stok;
  final double fiyat; 
  final IconData ikon;
  final Color ikonRengi;

  Urun({
    required this.ad,
    required this.stok,
    required this.fiyat, 
    required this.ikon,
    required this.ikonRengi,
  });
}