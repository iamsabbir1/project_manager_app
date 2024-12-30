import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashScreen({
    super.key,
    required this.onInitializationComplete(),
  });

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      Future.delayed(const Duration(seconds: 3)).then((_) {
        widget.onInitializationComplete();
      });
    } else {
      widget.onInitializationComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/manager.png'),
            ),
          ),
        ),
      ),
    );
  }
}
