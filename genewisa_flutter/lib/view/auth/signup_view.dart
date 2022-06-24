import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../api/api.dart';
import '../../view/widget/auth_container_header.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/auth_text_field.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
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
                      Positioned(top: 0,child: AuthTextField(
                        hintText: 'Nama Lengkap',
                        textController: namaController,
                      )),
                      Positioned(top: 79, child: AuthTextField(
                        hintText: 'Username',
                        textController: usernameController,
                      )),
                      Positioned(top: 158,child: AuthTextField(
                        hintText: 'Password',
                        textController: passwordController,
                      )),
                      Positioned(
                        top: 237,
                        child: Container(
                          width: 228,
                          height: 53,
                          decoration: GenewisaTheme.buttonContainer(),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signup();
                              }
                            },
                            style: GenewisaTheme.geneButton(),
                            child: Text(
                              _isLoading ? 'Mendaftarkan akun...' : 'Daftar',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginView())
                                    );
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

  void _signup() async{
    setState(() {
      _isLoading = true;
    });

    List<String> name = namaController.text.split(" ");
    var  firstName, lastName;
    firstName = name[0];
    if (name.length>1){
      lastName = name.sublist(1,name.length).join(" ");
    }

    var data = {
      'username' : usernameController.text,
      'password' : passwordController.text,
      'first_name' : firstName,
      'last_name' : lastName
    };

    var res = await CallApi().postData(data, 'user-register');
    var body = json.decode(res.body);
    if(body['status']=='OK'){
      _showMsg("Berhasil membuat akun", Colors.green);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginView())
      );
    }else{
      _showMsg(body['error'][0], Colors.red);
    }

    setState(() {
      _isLoading = false;
    });
  }
}