import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ListReviewContainer extends StatefulWidget {
  final String url, nama, deskripsi;
  final double rating;

  const ListReviewContainer({
    Key? key,
    required this.url,
    required this.nama,
    required this.deskripsi,
    required this.rating
  }) : super(key: key);

  @override
  State<ListReviewContainer> createState() => _ListReviewContainerState();
}

class _ListReviewContainerState extends State<ListReviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      height: 300,
      decoration: GenewisaTheme.tileContainer(),
      child: Column(
        children: [
          RichText(
            text:TextSpan(
              style: GenewisaTextTheme.textTheme.headline2,
              children: <TextSpan>[
                TextSpan(text: "Review", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.url),
                backgroundColor: Colors.transparent,
                radius: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.nama, style: GenewisaTextTheme.textTheme.headline2,),
                RichText(
                  text:TextSpan(
                    style: GenewisaTextTheme.textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(text: "Rating : ", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: widget.rating.toString()),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10),
            child: RichText(
              text:TextSpan(
                style: GenewisaTextTheme.textTheme.bodyText1,
                children: <TextSpan>[
                  TextSpan(text: "Keterangan", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Text(widget.deskripsi, style: GenewisaTextTheme.textTheme.bodyText1,),
        ],
      ),
    );
  }
}
