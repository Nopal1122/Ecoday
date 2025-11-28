import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ecoday/core/theme.dart';
import 'package:ecoday/features/auth/login_page.dart';
import 'package:ecoday/features/auth/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GANTI DENGAN URL & KEY DARI DASHBOARD SUPABASE KAMU
  await Supabase.initialize(
    url: 'https://xyzcompany.supabase.co', 
    anonKey: 'eyJh......', 
  );

  runApp(const MyApp());
}

// Akses global client agar bisa dipanggil dimana saja
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoDay',
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: Center(child: Text("Supabase Ready! 🚀")),
      ),
    );
  }
}