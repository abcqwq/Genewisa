import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ListWisataContainer extends StatefulWidget {
  final String url, nama, lokasi;
  final double rating;

  const ListWisataContainer({
    Key? key,
    required this.url,
    required this.nama,
    required this.lokasi,
    required this.rating
  }) : super(key: key);

  @override
  State<ListWisataContainer> createState() => _ListWisataContainerState();
}

class _ListWisataContainerState extends State<ListWisataContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
      padding: EdgeInsets.all(20),
      height: 124,
      decoration: GenewisaTheme.tileContainer(),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.url),
              backgroundColor: Colors.transparent,
              radius: 36,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.nama, style: GenewisaTextTheme.textTheme.headline2,),
              Text(widget.lokasi, style: GenewisaTextTheme.textTheme.bodyText1,),
              Row(
                children: [
                  Text("Rating : ", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  )),
                  Text(widget.rating.toString())
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
