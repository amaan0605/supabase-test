import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SupabaseClient superbase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME SCREEN'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text(data)
            TextButton(
                onPressed: () {
                  superbase.auth.signOut();
                },
                child: const Text('Log out')),
          ],
        ),
      ),
    );
  }
}
