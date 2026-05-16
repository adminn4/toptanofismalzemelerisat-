import 'package:flutter/material.dart';
import 'DetaySayfasi.dart';
import 'Urun.dart';
  

class UrunlerSayfasi extends StatelessWidget {
  final List<Urun> urunler = [
    Urun(ad: 'Kalem Seti', stok: 'Stok: Var', fiyat: 15.0, ikon: Icons.edit, ikonRengi: Colors.red),
    Urun(ad: 'Koli Bantı', stok: 'Stok: Var', fiyat: 12.5, ikon: Icons.inventory_2, ikonRengi: Colors.brown),
    Urun(ad: 'Deri Ajanda', stok: 'Stok: Az', fiyat: 45.0, ikon: Icons.menu_book, ikonRengi: Colors.deepPurple),
  ];

  UrunlerSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toptan Ürün Listesi'),
        backgroundColor: Colors.orangeAccent,
  
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: urunler.length,
        itemBuilder: (context, index) {
          final urun = urunler[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(urun.ikon, color: urun.ikonRengi, size: 30),
              title: Text(urun.ad, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${urun.stok} \nBirim Fiyat: ${urun.fiyat} TL'), 
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetaySayfasi(
                      urunAdi: urun.ad,
                      stokDurumu: urun.stok,
                      birimFiyat: urun.fiyat, 
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}