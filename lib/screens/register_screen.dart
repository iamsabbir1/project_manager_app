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
  void registerContractor() async {
    final url = Uri.parse('http://127.0.0.1:8000/api');
    Logger().i(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
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
                          registerContractor();
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
