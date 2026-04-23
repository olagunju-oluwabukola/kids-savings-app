import 'package:flutter/material.dart';
import 'package:hsbc/pages/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/saving_plan_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavingPlanProvider(),
      child: MaterialApp(
        title: 'HSBC App',
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
