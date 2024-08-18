import 'package:flutter/material.dart';
import 'package:supabase_test/screens/auth/login_page.dart';
import 'package:supabase_test/screens/auth/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLoginPage = true;

  void togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginPage) {
      return LoginPage(onTap: () => togglePage());
    } else {
      return RegisterPage(onTap: () => togglePage());
    }
  }
}
