import 'package:flutter/material.dart';
import '../view/home_view.dart';

void main() {
  runApp(const GenewisaApp());
}

class GenewisaApp extends StatelessWidget {
  const GenewisaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genewisa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(title: 'Genewisa'),
    );
  }
}