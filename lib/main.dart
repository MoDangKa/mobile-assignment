import 'package:flutter/material.dart';
import 'package:mobile_assignment/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 40, 189, 253),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
