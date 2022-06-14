import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/widget/list_wisata_container.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30,right: 30, top: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListWisataContainer(
                nama: "Wisata 1",
                lokasi: "Bandung, Jawa Barat",
                url: "https://cdn.discordapp.com/attachments/976696861207433219/984030204844453888/Rectangle_3.jpg",
                rating: 5,
              ),
              ListWisataContainer(
                nama: "Wisata 2",
                lokasi: "Bogor, Jawa Barat",
                url: "https://cdn.discordapp.com/attachments/976696861207433219/984030204844453888/Rectangle_3.jpg",
                rating: 5,
              )
            ],
          ),
      ),
      ),
    );
  }
}
