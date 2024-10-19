import 'package:flutter/material.dart';
import 'package:mobil_isletim_sistemleri/Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white70),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.grey),
    ),
        ),
      home:  MobileOSPage(),
    );
  }
}

