import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AnaIskelet.dart';

class KayitOlSayfasi extends StatefulWidget {
  const KayitOlSayfasi({super.key});

  @override
  State<KayitOlSayfasi> createState() => _KayitOlSayfasiState();
}

class _KayitOlSayfasiState extends State<KayitOlSayfasi> {
  final _emailKontrol = TextEditingController();
  final _sifreKontrol = TextEditingController();

  Future<void> _kayitOl() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailKontrol.text.trim(),
        password: _sifreKontrol.text.trim(),
      );
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AnaIskelet()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt Hatası: ${e.toString()}'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _girisYap() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailKontrol.text.trim(),
        password: _sifreKontrol.text.trim(),
      );
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AnaIskelet()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş Hatası: E-posta veya şifre yanlış!'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toptan Uygulamam - Giriş'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.storefront, size: 80, color: Colors.orange),
              const SizedBox(height: 20),
              TextField(
                controller: _emailKontrol,
                decoration: const InputDecoration(
                  labelText: 'E-posta Adresiniz', 
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _sifreKontrol,
                decoration: const InputDecoration(
                  labelText: 'Şifre', 
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _girisYap,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Giriş Yap', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _kayitOl,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Yeni Kayıt Ol', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}