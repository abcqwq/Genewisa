import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../theme/genewisa_text_theme.dart';
import '../auth/login_view.dart';
import '../home/home_view.dart';
import '../home/settings_view.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key}) : preferredSize = const Size.fromHeight(80.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>{

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'Group_9.svg',
              semanticsLabel: 'Genewisa Icon',
            ),
            iconSize: 40,
            onPressed: () {
              //Navigator.pushNamed(context, '/');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView())
              );
            },
          ),
          Text(
            'Genewisa',
            style: GenewisaTextTheme.textTheme.headline2,
          ),
        ]
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: SvgPicture.asset(
            'three_dots_icon.svg',
            semanticsLabel: 'Three Dots Icon',
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
          ),
          ),
          onSelected: (selected) {
            if (selected == 'Log Out') {
              _logout();
            }else if(selected == 'Settings'){
              //Navigator.pushNamed(context, '/settings');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsView())
              );
            }
          },
          itemBuilder: (_) => <PopupMenuEntry>[
            PopupMenuItem(
              value: 'Settings',
              child: Text('Settings', style: GenewisaTextTheme.textTheme.headline6,),
            ),
            PopupMenuItem(
              value: 'Log Out',
              child: Text('Log Out', style: GenewisaTextTheme.textTheme.headline5,),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 100,
      leadingWidth: 100,
    );
  }

  void _logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'token' : localStorage.getString('token'),
    };

    var res = await CallApi().postData(data, 'user-logout');
    var body = json.decode(res.body);
    if(body['status']=='OK'){
      localStorage.remove('token');
      print(body);
      _showMsg("Berhasil log out", Colors.green);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView())
      );
    }else{
      print(body);
    }
  }
}
