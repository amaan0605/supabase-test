import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/screens/home/category_page.dart';
import 'package:supabase_test/services/database/database.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SupabaseClient superbase = Supabase.instance.client;
  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('HOME SCREEN'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                  onPressed: () {
                    superbase.auth.signOut();
                  },
                  icon: const Icon(Icons.logout)),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.laptop),
                  title: const Text('Laptops'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(categoryName: 'laptops')));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.smartphone),
                  title: const Text('Mobiles'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(categoryName: 'mobiles')));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.watch),
                  title: const Text('Smart Watch'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(categoryName: 'smart_watches')));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.tablet),
                  title: const Text('Tablets'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(categoryName: 'tablets')));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
