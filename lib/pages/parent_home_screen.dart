import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  final String name;
  const ParentHomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Welcome, $name! 👋\n(Parent Home - Coming Soon)",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
