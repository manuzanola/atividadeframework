import 'package:flutter/material.dart';
import 'TelaLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F6BF4)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const TelaLogin(),
    );
  }
}
