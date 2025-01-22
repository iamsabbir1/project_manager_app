//packages
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_elevated_button.dart';
import '../models/contractor.dart';
import '../widgets/custom_text_button.dart';

import '../services/navigation_services.dart';
import '../services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;
  final _formKey = GlobalKey<FormState>();
  String? _token;
  bool _isLoading = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _token = await AuthService().login(_email!, _password!);

      if (_token != null) {
        Logger().i('Token: $_token');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/icon/manager.png'),
              radius: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextFormField(
                      onSaved: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      //regEx: '^[a-zA-Z0-9._%+-]+@gmail\\.com\$',
                      regEx: '',
                      hintText: 'Email',
                      errorMessage: 'Please enter an valid email',
                      title: 'Email',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextFormField(
                      onSaved: (value) {
                        _password = value;
                      },
                      regEx: '',
                      hintText: 'Password',
                      title: 'Password',
                      errorMessage: 'Please enter valid password',
                      obscureText: true,
                      isItPassword: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CustomElevatedButton(
                      isLoading: _isLoading,
                      onPressed: () {
                        login();
                      },
                      title: 'Login',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                CustomTextButton(
                  onPressed: () {
                    NavigationServices().navigateTo('/register');
                  },
                  title: 'Register',
                  isLoading: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
