import 'package:flutter/material.dart';
import 'package:twitter_app/screens/home_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme customize
      theme: ThemeData(useMaterial3: false),
      home: const HomeScreen(),
    );
  }
}
