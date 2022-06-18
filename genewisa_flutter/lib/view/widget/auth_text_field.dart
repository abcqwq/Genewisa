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
    return SizedBox(
      width: 228,
      height: 53,
      child: TextFormField(
        style: GenewisaTextTheme.textTheme.bodyText1,
        controller: widget.textController,
        
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30),
          labelText: widget.hintText,
          labelStyle: GenewisaTextTheme.textTheme.bodyText1,
          errorStyle: GoogleFonts.quicksand(fontSize: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
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
      ),
    );
  }
}