import 'package:flutter/material.dart';
import 'package:pics/src/screens/login_screen.dart';
import 'src/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pics',
      home: LoginScreen(),
    );
  }
}
