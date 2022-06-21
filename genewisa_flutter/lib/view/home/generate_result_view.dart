import 'package:flutter/material.dart';

import '../../theme/genewisa_text_theme.dart';
import '../widget/list_wisata_container.dart';
import 'detailwisata_view.dart';

class GenerateResultView extends StatefulWidget {
  GenerateResultView({Key? key}) : super(key: key);

  @override
  State<GenerateResultView> createState() => _GenerateResultViewState();
}

class _GenerateResultViewState extends State<GenerateResultView> {
  final List<Map<String, dynamic>> _allWisata = [
    {
      "id": 1,
      "nama": "Wisata 1",
      "url":
          "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480",
      "lokasi": "Bandung, Jawa Barat",
      "rating": 5
    },
    {
      "id": 2,
      "nama": "Wisata 2",
      "url":
          "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480",
      "lokasi": "Bandung, Jawa Barat",
      "rating": 5
    },
    {
      "id": 3,
      "nama": "Wisata 3",
      "url":
          "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480",
      "lokasi": "Bogor, Jawa Barat",
      "rating": 5
    },
  ];

  List<Map<String, dynamic>> _foundWisata = [];
  @override
  initState() {
    _foundWisata = _allWisata;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 100,
        title: IconButton(
          iconSize: 35,
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Ini tempat wisata buat kamu',
                style: GenewisaTextTheme.textTheme.headline2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundWisata.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundWisata.length,
                      itemBuilder: (context, index) => InkWell(
                        child: ListWisataContainer(
                          nama: _foundWisata[index]["nama"].toString(),
                          lokasi: _foundWisata[index]["lokasi"].toString(),
                          url: _foundWisata[index]["url"].toString(),
                          rating: _foundWisata[index]["rating"],
                        ),
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   '/detailwisata',
                          //   arguments: _foundWisata[index],
                          // );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailWisataView(foundWisata: _foundWisata[index])
                              )
                          );
                        },
                      ),
                    )
                  : Text(
                      'Pencarian tidak ditemukan',
                      style: GenewisaTextTheme.textTheme.labelMedium,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
