import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/home/generate_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/home/detailwisata_view.dart';
import 'view/home/settings_view.dart';
import '../theme/genewisa_theme.dart';
import '../view/auth/signup_view.dart';
import '../view/auth/login_view.dart';
import 'view/home/home_view.dart';
import 'package:genewisa_flutter/utils/PreferenceGlobal.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceGlobal.init();

  runApp(const GenewisaApp());
}

class GenewisaApp extends StatefulWidget {
  const GenewisaApp({Key? key}) : super(key: key);

  @override
  State<GenewisaApp> createState() => _GenewisaAppState();
}

class _GenewisaAppState extends State<GenewisaApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.get('token');
    print(token);
    _isLoggedIn = token != null;

    return _isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genewisa',
      theme: GenewisaTheme.geneTheme(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => LoginView(),
      //   '/signup':(context) => SignUpView(),
      //   '/': (context) => HomeView(),
      //   '/gen': (context) => GenerateView(),
      //   //'/detailwisata': (context) => DetailWisataView(),
      //   '/settings': (context) => SettingsView(),
      // },
      home: _isLoggedIn ? HomeView() : LoginView(),
    );
  }
}
