import 'package:flutter/material.dart';

class GenewisaTheme {
  static ThemeData geneTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  static ButtonStyle geneButton() {
    return ElevatedButton.styleFrom(
      primary: Colors.blue[900],
      textStyle: const TextStyle(fontSize: 18),
      padding: const EdgeInsets.all(15),
    );
  }
}