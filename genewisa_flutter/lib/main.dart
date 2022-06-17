import 'package:flutter/material.dart';
import '../view/detailwisata_view.dart';
import '../view/settings_view.dart';
import '../theme/genewisa_theme.dart';
import '../view/auth/signup_view.dart';
import '../view/auth/login_view.dart';
import '../view/home_view.dart';

void main() => runApp(const GenewisaApp());

class GenewisaApp extends StatelessWidget {
  const GenewisaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genewisa',
      theme: GenewisaTheme.geneTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/signup':(context) => SignUpView(),
        '/': (context) => HomeView(), 
        '/detailwisata': (context) => DetailWisataView(),
        '/settings': (context) => SettingsView(), 
      },
    );
  }
}