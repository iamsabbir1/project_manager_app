import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_text_field.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../services/navigation_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  @override
  void initState() {
    super.initState();
    fetchContractorToken();
  }

  void registerContractor(String name, String email, String password) async {
    const String baseUrl = 'http://127.0.0.1:8000/api/contractor/create/';
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 201) {
      Logger().i('succesfully register contractor');
    } else {
      Logger().e(response.statusCode);
      throw Exception('Failed to load projects');
    }
  }

  void fetchContractorToken() async {
    const String baseUrl = 'http://127.0.0.1:8000/api/contractor/token/';
    final url = Uri.parse(baseUrl);
    Logger().i(url);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': 'contractor3@example.com',
          'password': 'testpass123@',
        }));

    if (response.statusCode == 200) {
      Logger().i('succesfully fetch token');
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        onSaved: (value) {},
                        regEx: '',
                        hintText: 'Name',
                        title: 'Name',
                        errorMessage: 'Enter an valid name',
                      ),
                      CustomTextFormField(
                        onSaved: (value) {},
                        regEx: '',
                        hintText: 'Email',
                        errorMessage: 'Enter an valid email',
                        title: 'Email',
                      ),
                      CustomTextFormField(
                        onSaved: (value) {},
                        regEx: '',
                        hintText: 'Phone',
                        errorMessage: 'Enter an valid phone number',
                        title: 'Phone',
                      ),
                      CustomTextFormField(
                        onSaved: (value) {},
                        regEx: '',
                        hintText: 'Status',
                        errorMessage: 'Enter an valid status',
                        title: 'Status',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomElevatedButton(
                        isLoading: false,
                        onPressed: () {
                          registerContractor(
                            'Contractor 5',
                            'contractor5@example.com',
                            'testpass123@',
                          );
                        },
                        title: 'Register',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  CustomTextButton(
                    onPressed: () {
                      NavigationServices().navigateToRoute('/');
                    },
                    title: 'Login',
                    isLoading: false,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
