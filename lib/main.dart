import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import './screens/login_screen.dart';
import './services/navigation_services.dart';
import './screens/register_screen.dart';

void main() {
  runApp(
    SplashScreen(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(const MyApp());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: NavigationServices().navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (ctx) {
          return const LoginScreen();
        },
        '/register': (ctx) {
          return const RegisterScreen();
        }
      },
    );
  }
}
