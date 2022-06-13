import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/genewisa_text_theme.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key}) : preferredSize = const Size.fromHeight(80.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>{

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
            onPressed: () { Navigator.pushNamed(context, '/'); },
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
              Navigator.pushNamed(context, '/login');
            }
          },
          itemBuilder: (_) => <PopupMenuEntry>[
            const PopupMenuItem(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem(
              value: 'Log Out',
              child: Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 100,
      leadingWidth: 100,
      toolbarTextStyle: GenewisaTextTheme.textTheme.bodyText1,
    );
  }
}
