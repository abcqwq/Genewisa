import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../model/user_model.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? username, firstName, lastName;

  void getUser() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'token' : localStorage.getString('token'),
      'username' : localStorage.getString('username')
    };

    var res = await CallApi().getData(data, 'user/'+(data['username'] ?? ''));
    var body = json.decode(res.body);
    localStorage.setString('first_name', body['data']['first_name']);
    localStorage.setString('last_name', body['data']['last_name']);

    setState(() {
      username = localStorage.getString('username');
      firstName = localStorage.getString('first_name');
      lastName = localStorage.getString('last_name');
    });
  }

  @override
  void initState() {
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 168,
              margin: const EdgeInsets.only(top: 20, bottom: 15, left: 30, right: 30),
              decoration: GenewisaTheme.tileContainer(color: const Color(0xFFFFEE57)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.black,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage("https://images-ext-1.discordapp.net/external/8cWjK0gRjXAALR4npR2qYFVscpnJEkFoyWBAVQszngQ/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/707445135318974515/93ac9643a293a7ae11b3375beb63fc44.png?width=480&height=480"),
                      radius: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(firstName ?? '', style: GenewisaTextTheme.textTheme.headline2,),
                      Text(lastName ?? '', style: GenewisaTextTheme.textTheme.headline2,),
                      Text(username ?? '', style: GenewisaTextTheme.textTheme.bodyText1,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 135,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
              decoration: GenewisaTheme.tileContainer(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      'statistic_icon.svg',
                      semanticsLabel: 'Statistic Icon',
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('7', style: GenewisaTextTheme.textTheme.headlineLarge,),
                          Text('Dikunjungi', style: GenewisaTextTheme.textTheme.bodyText1,),
                        ],
                      ),
                      const SizedBox(width: 50,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('5', style: GenewisaTextTheme.textTheme.headlineLarge,),
                          Text('Review', style: GenewisaTextTheme.textTheme.bodyText1,),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}