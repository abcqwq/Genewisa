import 'package:flutter/material.dart';

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
        hintText: widget.hintText,
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