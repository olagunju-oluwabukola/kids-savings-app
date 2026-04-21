import 'package:flutter/material.dart';

class YouthHomeScreen extends StatelessWidget {
  final String name;
  const YouthHomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Welcome, $name! 👋\n(Youth Home - Coming Soon)",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
