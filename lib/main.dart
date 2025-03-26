import 'package:flutter/material.dart';
import 'package:smart_safe_return/components/navbar/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YoungFlix',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.white,
      ),
      home: const Scaffold(
        body: Bottom(), // Bottom 컴포넌트로 모든 UI를 이동
      ),
    );
  }
}
