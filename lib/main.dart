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
      debugShowCheckedModeBanner: false,
      title: 'Smart Safe Return',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.white,
      ),
      home: const Bottom(), // Bottom 컴포넌트가 최상단으로 항상 탭 유지됨
    );
  }
}
