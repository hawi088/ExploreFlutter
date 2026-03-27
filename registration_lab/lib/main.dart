import 'package:flutter/material.dart';
import 'package:registration_app/screens/registration_screen.dart';

void main() {
  runApp(const RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const RegistrationScreen(),
    );
  }
}