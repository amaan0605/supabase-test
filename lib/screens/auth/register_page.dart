import 'package:flutter/material.dart';
import 'package:supabase_test/components/my_button.dart';
import 'package:supabase_test/components/my_textfield.dart';
import 'package:supabase_test/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function() onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController officePhoneController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  AuthServices authServices = AuthServices();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    locationController.dispose();
    companyAddressController.dispose();
    companyNameController.dispose();
    phoneNumberController.dispose();
    confirmPasswordController.dispose();
    officePhoneController.dispose();
    countryController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              //logo
              const Icon(Icons.person, size: 80),
              const SizedBox(height: 20),
              //title
              const Text(
                'R E G I S T E R   P A G E',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              //textfield
              MyTextfield(
                hintText: 'Company Name',
                obscureText: false,
                controller: companyNameController,
              ),

              MyTextfield(
                hintText: 'Company Address',
                obscureText: false,
                controller: companyAddressController,
              ),
              MyTextfield(
                hintText: 'Country',
                obscureText: false,
                controller: countryController,
              ),
              MyTextfield(
                hintText: 'City',
                obscureText: false,
                controller: cityController,
              ),
              MyTextfield(
                hintText: 'Office Number',
                obscureText: false,
                controller: officePhoneController,
              ),
              MyTextfield(
                hintText: 'Phone Number',
                obscureText: false,
                controller: phoneNumberController,
              ),
              MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),

              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              MyTextfield(
                hintText: 'Confirm Password',
                obscureText: false,
                controller: confirmPasswordController,
              ),
              MyTextfield(
                hintText: 'Location Map URL(option)',
                obscureText: false,
                controller: locationController,
              ),

              const SizedBox(height: 20),
              //button
              MyButton(
                onTap: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      companyNameController.text.isNotEmpty &&
                      companyAddressController.text.isNotEmpty &&
                      countryController.text.isNotEmpty &&
                      cityController.text.isNotEmpty &&
                      officePhoneController.text.isNotEmpty &&
                      phoneNumberController.text.isNotEmpty) {
                    print('button presssed');
                    authServices.register(
                        emailController.text,
                        passwordController.text,
                        companyNameController.text,
                        companyAddressController.text,
                        countryController.text,
                        cityController.text,
                        officePhoneController.text,
                        phoneNumberController.text,
                        locationController.text,
                        context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill the all neccasaty Feilds!'),
                    ));
                  }
                },
                text: 'R E G I S T E R',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already registered? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
