import 'package:flutter/material.dart';
import '../view/widget/list_wisata_container.dart';

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
        padding: const EdgeInsets.only(left: 30,right: 30, top: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListWisataContainer(
                nama: "Wisata 1",
                lokasi: "Bandung, Jawa Barat",
                url: "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480",
                rating: 5,
              ),
              ListWisataContainer(
                nama: "Wisata 2",
                lokasi: "Bogor, Jawa Barat",
                url: "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480",
                rating: 5,
              )
            ],
          ),
      ),
      ),
    );
  }
}
