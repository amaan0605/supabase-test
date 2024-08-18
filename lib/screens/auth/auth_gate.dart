import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/screens/auth/login_or_register.dart';
import 'package:supabase_test/screens/home/home_page.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.session != null) {
                return HomePage();
              } else {
                return const LoginOrRegister();
              }
            } else if (snapshot.hasError) {
              return const Center(child: Text('ERROR'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
