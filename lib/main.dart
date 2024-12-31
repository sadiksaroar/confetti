import 'package:flutter/material.dart';
import 'package:happy/CelebrationScreen/CelebrationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CelebrationScreen(),
    );
  }
}
