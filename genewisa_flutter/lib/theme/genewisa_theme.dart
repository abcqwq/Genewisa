import 'package:flutter/material.dart';

class GenewisaTheme {
  static ThemeData geneTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  static ButtonStyle geneButton() {
    return ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
      textStyle: const TextStyle(fontSize: 18),
      minimumSize: const Size.fromHeight(63),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static BoxDecoration authButtonContainer() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: <Color>[
          Color(0xFF9FACE6),
          Color(0xFF74EBD5),
        ]
      )
    );
  }

  static BoxDecoration cancelButtonContainer() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: <Color>[
          Color(0xFFFF3434),
          Color(0xFF848AA5),
        ]
      )
    );
  }

  static BoxDecoration tileContainer({color = Colors.transparent}) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      color: color,
    );
  }
}