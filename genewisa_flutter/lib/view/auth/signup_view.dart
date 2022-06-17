import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../view/widget/auth_container_header.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/auth_text_field.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 271,
          height: 608,
          decoration: GenewisaTheme.tileContainer(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AuthContainerHeader(),
                SizedBox(
                  height: 367,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(top: 0,child: AuthTextField(hintText: 'Nama Lengkap')),
                      Positioned(top: 79, child: AuthTextField(hintText: 'Username')),
                      Positioned(top: 158,child: AuthTextField(hintText: 'Password')),
                      Positioned(
                        top: 237,
                        child: Container(
                          width: 228,
                          height: 53,
                          decoration: GenewisaTheme.buttonContainer(),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/login');
                              }
                            },
                            style: GenewisaTheme.geneButton(),
                            child: Text(
                              'Daftar',
                              style: GenewisaTextTheme.textTheme.button,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 316,
                        child: RichText(
                          text: TextSpan(
                            style: GenewisaTextTheme.textTheme.bodyText1,
                            children: <TextSpan>[
                              const TextSpan(text: 'Punya akun? '),
                              TextSpan(
                                text: 'Login',
                                style: GenewisaTextTheme.textTheme.bodyText2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap=() {
                                    Navigator.pushNamed(context, '/login');
                                  } 
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}