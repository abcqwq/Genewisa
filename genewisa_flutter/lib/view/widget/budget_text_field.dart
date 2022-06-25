import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';

class BudgetTextField extends StatefulWidget {
  BudgetTextField({Key? key, required this.label, required this.textController})
      : super(key: key);

  final String label;
  final TextEditingController textController;

  @override
  State<BudgetTextField> createState() => _BudgetTextFieldState();
}

class _BudgetTextFieldState extends State<BudgetTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      keyboardType: TextInputType.number,
      style: GenewisaTextTheme.textTheme.bodyText1,
      decoration: InputDecoration(
        prefixText: 'Rp',
        labelText: widget.label,
        labelStyle: GenewisaTextTheme.textTheme.bodyText1,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
