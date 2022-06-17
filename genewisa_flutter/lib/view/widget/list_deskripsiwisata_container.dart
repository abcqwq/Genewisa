import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ListDeskripsiWisataContainer extends StatefulWidget {
  final String tittle, deskripsi;

  const ListDeskripsiWisataContainer({
    Key? key,
    required this.tittle,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<ListDeskripsiWisataContainer> createState() => _ListDeskripsiWisataContainerState();
}

class _ListDeskripsiWisataContainerState extends State<ListDeskripsiWisataContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: GenewisaTheme.tileContainer(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text:TextSpan(
                style: GenewisaTextTheme.textTheme.headline2,
                children: <TextSpan>[
                  TextSpan(text: widget.tittle, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text(widget.deskripsi, style: GenewisaTextTheme.textTheme.bodyText1),
        ],
      ),
    );
  }
}
