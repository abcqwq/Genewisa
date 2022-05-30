import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../../view/widget/auth_text_field.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Genewisa', 
                style: GenewisaTextTheme.textTheme.headline1,
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Login', 
                style: GenewisaTextTheme.textTheme.headline2,
              ),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.blue[600],
                    size: 30,
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: AuthTextField(hintText: 'Username')
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lock,
                    color: Colors.blue[600],
                    size: 30,
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: AuthTextField(hintText: 'Password')
                  ),
                ],
              ),
              
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/');
                  }
                },
                style: GenewisaTheme.geneButton(),
                child: const Text('Login'),
              ),
              const SizedBox(height: 40.0,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: GenewisaTheme.geneButton(),
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}