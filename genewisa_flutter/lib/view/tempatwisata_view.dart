import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/widget/list_wisata_container.dart';

class TempatWisataView extends StatefulWidget {
  const TempatWisataView({Key? key}) : super(key: key);

  @override
  State<TempatWisataView> createState() => _TempatWisataViewState();
}

class _TempatWisataViewState extends State<TempatWisataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30,right: 30, top: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 5),
                  child: TextField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search', 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                    ),
                  ),
                ),
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
                ),
                ListWisataContainer(
                  nama: "Wisata 3",
                  lokasi: "Bandung, Jawa Barat",
                  url: "https://cdn.discordapp.com/attachments/976696861207433219/984030204844453888/Rectangle_3.jpg",
                  rating: 5,
                ),
                ListWisataContainer(
                  nama: "Wisata 4",
                  lokasi: "Bogor, Jawa Barat",
                  url: "https://cdn.discordapp.com/attachments/976696861207433219/984030204844453888/Rectangle_3.jpg",
                  rating: 5,
                ),
                ListWisataContainer(
                  nama: "Wisata 5",
                  lokasi: "Bogor, Jawa Barat",
                  url: "https://cdn.discordapp.com/attachments/976696861207433219/984030204844453888/Rectangle_3.jpg",
                  rating: 5,
                ),
              ],
            ),
          ),
      ),
      ),
    );
  }
}
