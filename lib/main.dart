import 'package:flutter/material.dart';
import 'package:news_app/screens/HomeScreen.dart';

void main() {
  // runApp(const MyApp());

  runApp(const MyApp());
  // runApp(const MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Scaffold(
  //     body: Center(child: Text("Hello World")),
  //   ),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // optional, hides debug banner
      home: const NewsApp(),
    );
  }
}
