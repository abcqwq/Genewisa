import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatefulWidget {
  AuthTextField({Key? key, required this.hintText}) : super(key: key);

  final String hintText;
  final textController = TextEditingController();

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: GenewisaTextTheme.textTheme.bodyText1,
        errorStyle: GoogleFonts.quicksand(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF9FACE6)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
      obscureText: 
        widget.hintText == 'Password'
        ? true 
        : false,
    );
  }
}