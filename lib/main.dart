import 'package:flutter/material.dart';
import 'screens/first_page/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donation App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF137C5B)),
        scaffoldBackgroundColor: const Color(0xFFF6F9F8),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}
