import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SepetModeli.dart';
import 'Urun.dart';

class DetaySayfasi extends StatefulWidget {
  final String urunAdi;
  final String stokDurumu;
  final double birimFiyat;

  const DetaySayfasi({super.key, required this.urunAdi, required this.stokDurumu, required this.birimFiyat});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  int _secilenAdet = 50;

  void _artir() { setState(() { _secilenAdet += 10; }); }
  void _azalt() { if (_secilenAdet > 10) setState(() { _secilenAdet -= 10; }); }

  @override
  Widget build(BuildContext context) {
    double toplamTutar = _secilenAdet * widget.birimFiyat; 

    return Scaffold(
      appBar: AppBar(title: Text(widget.urunAdi), backgroundColor: Colors.orangeAccent),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.urunAdi, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Birim Fiyat: ${widget.birimFiyat} TL', style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const Text('Sipariş Adedi:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(onPressed: _azalt, icon: const Icon(Icons.remove_circle, color: Colors.red, size: 40)),
                Text('$_secilenAdet', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                IconButton(onPressed: _artir, icon: const Icon(Icons.add_circle, color: Colors.green, size: 40)),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Toplam Tutar:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('$toplamTutar TL', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  final eklenecekUrun = Urun(
                    ad: widget.urunAdi,
                    stok: 'Adet: $_secilenAdet',
                    fiyat: toplamTutar,
                    ikon: Icons.shopping_bag,
                    ikonRengi: Colors.orange,
                  );

                  Provider.of<SepetModeli>(context, listen: false).sepeteEkle(eklenecekUrun);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sepete Eklendi: $toplamTutar TL'), backgroundColor: Colors.green),
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
                label: const Text('Sepete Ekle', style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}