import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/home/generate_view.dart';
import 'view/home/detailwisata_view.dart';
import 'view/home/settings_view.dart';
import '../theme/genewisa_theme.dart';
import '../view/auth/signup_view.dart';
import '../view/auth/login_view.dart';
import 'view/home/home_view.dart';

void main() => runApp(const GenewisaApp());

class GenewisaApp extends StatelessWidget {
  const GenewisaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genewisa',
      theme: GenewisaTheme.geneTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginView(),
        '/signup':(context) => SignUpView(),
        '/': (context) => HomeView(), 
        '/gen': (context) => GenerateView(),
        '/detailwisata': (context) => DetailWisataView(),
        '/settings': (context) => SettingsView(), 
      },
    );
  }
}