import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../view/widget/auth_container_header.dart';
import '../widget/auth_text_field.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 271,
          height: 529,
          decoration: GenewisaTheme.tileContainer(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AuthContainerHeader(),
                SizedBox(
                  height: 314,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(top: 0, child: AuthTextField(hintText: 'Username')),
                      Positioned(top: 79, child: AuthTextField(hintText: 'Password')),
                      Positioned(
                        top: 158,
                        child: SizedBox(
                          width: 228,
                          height: 53,
                          child: Container(
                            decoration: GenewisaTheme.buttonContainer(),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/');
                                }
                              },
                              style: GenewisaTheme.geneButton(),
                              child: Text(
                                'Login',
                                style: GenewisaTextTheme.textTheme.button,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 237,
                        child: RichText(
                          text: TextSpan(
                            style: GenewisaTextTheme.textTheme.bodyText1,
                            children: <TextSpan>[
                              const TextSpan(text: 'Tidak punya akun? '),
                              TextSpan(
                                text: 'Daftar',
                                style: GenewisaTextTheme.textTheme.bodyText2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap=() {
                                    Navigator.pushNamed(context, '/signup');
                                  }, 
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