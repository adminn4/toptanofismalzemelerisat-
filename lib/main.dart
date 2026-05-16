  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// FİREBASE BAĞLANTILARI
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// BİZİM DOSYALARIMIZ
import 'SepetModeli.dart';
import 'UrunlerSayfasi.dart';
import 'AnaIskelet.dart';
import 'KayitOlSayfasi.dart';

void main() async {
  // 1. Flutter ve Firebase arasındaki köprüyü kur
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Firebase motorunu ateşle
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. Uygulamayı Provider (Depo) ile birlikte ayağa kaldır
  runApp(
    ChangeNotifierProvider(
      create: (context) => SepetModeli(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toptan Satış',
      debugShowCheckedModeBanner: false, // Ekrandaki "Debug" yazısını kaldırır
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      // Uygulama ilk açıldığında gösterilecek sayfa
      home: const KayitOlSayfasi(),
    );
  }
}