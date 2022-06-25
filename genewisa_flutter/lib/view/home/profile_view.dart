import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genewisa_flutter/utils/PreferenceGlobal.dart';
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
  String? username, firstName, lastName, img;
  void _getUser() async {
    var data = {
      'token': PreferenceGlobal.getPref().getString('token'),
      'username': PreferenceGlobal.getPref().getString('username')
    };

    var res = await CallApi().getData('user/' + (data['username'] ?? ''));
    var body = json.decode(res.body);
    if (body['status'] == 'OK') {
      await PreferenceGlobal.getPref()
          .setString('first_name', body['data']['first_name'] ?? "");
      await PreferenceGlobal.getPref()
          .setString('last_name', body['data']['last_name'] ?? "");
      await PreferenceGlobal.getPref()
          .setString('img', body['data']['img'] ?? "");
      setState(() {
        username = PreferenceGlobal.getPref().getString('username');
        firstName = PreferenceGlobal.getPref().getString('first_name');
        lastName = PreferenceGlobal.getPref().getString('last_name');
        img = PreferenceGlobal.getPref().getString('img');
      });
    }
  }

  @override
  void initState() {
    _getUser();
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
              constraints: BoxConstraints(minHeight: 168, maxWidth: MediaQuery.of(context).size.width),
              margin: const EdgeInsets.only(
                  top: 20, bottom: 15, left: 30, right: 30),
              decoration:
                  GenewisaTheme.tileContainer(color: const Color(0xFFFFEE57)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(img ??
                          "https://med.gov.bz/wp-content/uploads/2020/08/dummy-profile-pic-300x300.jpg"),
                      radius: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        firstName ?? '',
                        style: GenewisaTextTheme.textTheme.headline2,
                      ),
                      Text(
                        lastName ?? '',
                        style: GenewisaTextTheme.textTheme.headline2,
                      ),
                      Text(
                        username ?? '',
                        style: GenewisaTextTheme.textTheme.bodyText1,
                      ),
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
                          Text(
                            '5',
                            style: GenewisaTextTheme.textTheme.headlineLarge,
                          ),
                          Text(
                            'Review',
                            style: GenewisaTextTheme.textTheme.bodyText1,
                          ),
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
