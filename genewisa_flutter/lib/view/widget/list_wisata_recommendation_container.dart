import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ListWisataRContainer extends StatefulWidget {
  final String url, nama, lokasi;
  final int estPrice;

  const ListWisataRContainer(
      {Key? key,
      required this.url,
      required this.nama,
      required this.lokasi,
      required this.estPrice})
      : super(key: key);

  @override
  State<ListWisataRContainer> createState() => _ListWisataRContainerState();
}

class _ListWisataRContainerState extends State<ListWisataRContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17),
      padding: const EdgeInsets.all(20),
      height: 124,
      decoration: GenewisaTheme.tileContainer(),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.url),
              backgroundColor: Colors.transparent,
              radius: 36,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.nama,
                  style: GenewisaTextTheme.textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.lokasi,
                  style: GenewisaTextTheme.textTheme.bodyText1,
                ),
                Row(
                  children: [
                    Text("Est. Budget : ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(widget.estPrice.toString())
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
