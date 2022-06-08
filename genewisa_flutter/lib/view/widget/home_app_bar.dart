import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Genewisa',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.normal
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
