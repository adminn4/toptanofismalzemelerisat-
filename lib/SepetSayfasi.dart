import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SepetModeli.dart';
import 'OdemeSayfasi.dart';

class SepetSayfasi extends StatelessWidget {
  const SepetSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    final sepetDeposu = Provider.of<SepetModeli>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.white),
            onPressed: () { sepetDeposu.sepetiBosalt(); },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: sepetDeposu.sepettekiUrunler.isEmpty
                ? const Center(child: Text('Sepetiniz boş.', style: TextStyle(fontSize: 18)))
                : ListView.builder(
                    itemCount: sepetDeposu.sepettekiUrunler.length,
                    itemBuilder: (context, index) {
                      final urun = sepetDeposu.sepettekiUrunler[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: Icon(urun.ikon, color: urun.ikonRengi),
                          title: Text(urun.ad, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${urun.stok}\nTutar: ${urun.fiyat} TL'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                            onPressed: () { sepetDeposu.urunuSil(urun); },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5, offset: const Offset(0, -3))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Genel Toplam', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('${sepetDeposu.genelToplam} TL', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                ElevatedButton(
                  onPressed: sepetDeposu.sepettekiUrunler.isEmpty ? null : () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OdemeSayfasi()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Ödeme Yap', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}