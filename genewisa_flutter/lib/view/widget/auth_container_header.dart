import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/genewisa_text_theme.dart';

class AuthContainerHeader extends StatelessWidget {
  const AuthContainerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 213,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SvgPicture.asset(
              'Group_9.svg',
              semanticsLabel: 'Genewisa Icon',
            ),
          ),
          Text(
            'Genewisa', 
            textAlign: TextAlign.center,
            style: GenewisaTextTheme.textTheme.headline1,
          ),
          const Divider(
            color: Colors.black, 
          ),
        ],
      ),
    );
  }
}