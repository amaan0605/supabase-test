// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  //INSTANCE
  final SupabaseClient supabase = Supabase.instance.client;

  //REGISTER USER
  Future<void> register(
      String email,
      String password,
      String companyName,
      String address,
      String country,
      String city,
      String officePhone,
      String mobilePhone,
      String? location,
      BuildContext context) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password, data: {
        "company_name": companyName,
        "address": address,
        "country": country,
        "city": city,
        "office_phone": officePhone,
        "mobile_phone": mobilePhone,
        "location_url": location ?? ""
      });
      final session = response.session;

      if (session != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('REGISTERED SUCCESFULLY!'),
        ));
        log('Register successful!');
        log('Access token: ${session.accessToken}');
      } else {
        log('Register failed!');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
      log('Error during register: $error');
    }
  }

  //LOGIN USER
  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final session = response.session;

      if (session != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('LOGIN SUCCESSFULLY!'),
        ));

        log('Login successful!');
        log('Access token: ${session.accessToken}');
      } else {
        log('Login failed!');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
      log('Error during login: $error');
    }
  }
}
