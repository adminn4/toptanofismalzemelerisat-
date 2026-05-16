import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'KayitOlSayfasi.dart';

class ProfilSayfasi extends StatelessWidget {
  const ProfilSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şirket Profili'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.store, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Topal Kırtasiye ve Ofis A.Ş.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          const Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.indigo),
              title: Text('Yetkili Kişi'),
              subtitle: Text('Abdurrahman Turan TOPAL'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Teslimat Adresi'),
              subtitle: Text('Selçuklu / Konya'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.account_balance, color: Colors.green),
              title: Text('Vergi Dairesi / No'),
              subtitle: Text('Meram V.D. / 1234567890'),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.redAccent,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const KayitOlSayfasi()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}