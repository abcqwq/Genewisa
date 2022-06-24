import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/auth/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../view/widget/auth_container_header.dart';
import '../home/home_view.dart';
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _showMsg(msg, Color clr) { //
    final snackBar = SnackBar(
      backgroundColor: clr,
      content: Text(msg, style: GenewisaTextTheme.textTheme.headline4),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Tutup',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _isLoading = false;

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
                      Positioned(top: 0, child: AuthTextField(
                        hintText: 'Username',
                        textController: usernameController,
                      )),
                      Positioned(top: 79, child: AuthTextField(
                        hintText: 'Password',
                        textController: passwordController,
                      )),
                      Positioned(
                        top: 158,
                        child: SizedBox(
                          width: 228,
                          height: 53,
                          child: Container(
                            decoration: GenewisaTheme.buttonContainer(),
                            child: ElevatedButton(
                              onPressed: _login,
                              style: GenewisaTheme.geneButton(),
                              child: Text(
                                _isLoading? 'Logging-in...' : 'Login',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignUpView())
                                    );
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

  void _login() async{
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username' : usernameController.text,
      'password' : passwordController.text
    };

    var res = await CallApi().postData(data, 'user-login');
    var body = json.decode(res.body);
    if(body['status']=='OK'){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['data']['token']);
      localStorage.setString('username', body['data']['username']);
      _showMsg("Berhasil login", Colors.green);
      print(body);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView())
      );
    }else{
      _showMsg(body['error'][0], Colors.red);
    }

    setState(() {
      _isLoading = false;
    });
  }
}