import 'package:flutter/material.dart';
import 'auth_text_field.dart';

class AuthTextFieldPadding extends StatefulWidget {
  AuthTextFieldPadding({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  State<AuthTextFieldPadding> createState() => _AuthTextFieldPaddingState();
}

class _AuthTextFieldPaddingState extends State<AuthTextFieldPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 21.5,
        right: 21.5,
        bottom: 17.0,
      ),
      child: AuthTextField(hintText: widget.hintText),
    );
  }
}
