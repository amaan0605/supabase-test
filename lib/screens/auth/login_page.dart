import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/components/my_button.dart';
import 'package:supabase_test/components/my_textfield.dart';
import 'package:supabase_test/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final Function() onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.flutter_dash,
              size: 50,
            ),
            const SizedBox(height: 10),
            //title
            const Text(
              'S U P A B A S E   A P P',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const Text(
              'L O G I N  P A G E',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            //textfields
            MyTextfield(
                hintText: 'Enter your email', controller: emailController),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Enter your password',
              controller: passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 20),

            //button
            MyButton(
                onTap: () {
                  authServices.login(
                      emailController.text, passwordController.text, context);
                },
                text: 'L O G I N'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Sign Up Now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
