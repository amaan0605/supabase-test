import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/constants/secret_key.dart';
import 'package:supabase_test/screens/auth/auth_gate.dart';
import 'package:supabase_test/screens/auth/login_or_register.dart';
import 'package:supabase_test/theme/light_theme.dart';

void main() async {
  await Supabase.initialize(
    url: SupabaseKey.url,
    anonKey: SupabaseKey.anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SUPABASE TEST',
        theme: lightTheme,
        home: AuthGate());
  }
}
