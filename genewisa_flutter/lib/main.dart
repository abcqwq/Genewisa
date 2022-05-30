import 'package:flutter/material.dart';
import '../theme/genewisa_theme.dart';
import '../view/auth/signup_view.dart';
import '../view/auth/login_view.dart';
import '../view/home_view.dart';

void main() {
  runApp(const GenewisaApp());
}

class GenewisaApp extends StatelessWidget {
  const GenewisaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genewisa App',
      theme: GenewisaTheme.geneTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/signup':(context) => SignUpView(),
        '/': (context) => HomeView(), 
      },
    );
  }
}