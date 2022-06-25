import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingTextField extends StatefulWidget {
  SettingTextField(
      {Key? key, required this.hintText, required this.textController, required this.visibility})
      : super(key: key);

  final String hintText;
  final TextEditingController textController;
  bool visibility;

  @override
  State<SettingTextField> createState() => _SettingTextField();
}

class _SettingTextField extends State<SettingTextField> {

  late bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.visibility;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9FACE6)),
          ),
          suffixIcon: (!widget.visibility)
            ? IconButton(
                icon: Icon(
                  _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : IconButton(onPressed: () {}, icon: const Icon(Icons.abc, color: Colors.white),),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          }
          return null;
        },
        obscureText: !_passwordVisible,
      ),
    );
  }
}
