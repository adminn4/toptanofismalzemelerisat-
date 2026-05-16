import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SepetModeli.dart'; // Ödememeyi yapınca sepet boşalsın diye ekledim

class OdemeSayfasi extends StatelessWidget {
  const OdemeSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Güvenli Ödeme'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Icon(Icons.credit_card, size: 80, color: Colors.teal),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Kredi Kartı Bilgileri',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            
            
            const TextField(
              decoration: InputDecoration(
                labelText: 'Kart Üzerindeki İsim',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            
            
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kart Numarası',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 20),
            
            
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'AA/YY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    obscureText: true, 
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ödeme Başarılı! Siparişiniz Hazırlanıyor.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  Provider.of<SepetModeli>(context, listen: false).sepetiBosalt();
                  
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('Ödemeyi Onayla', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}