import 'package:flutter/material.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';

class ListWisataSContainer extends StatefulWidget {
  final String url, nama, lokasi;

  const ListWisataSContainer(
      {Key? key,
      required this.url,
      required this.nama,
      required this.lokasi,})
      : super(key: key);

  @override
  State<ListWisataSContainer> createState() => _ListWisataSContainerState();
}

class _ListWisataSContainerState extends State<ListWisataSContainer> {
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
