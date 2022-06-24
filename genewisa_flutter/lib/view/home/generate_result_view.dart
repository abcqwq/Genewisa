import 'package:flutter/material.dart';
import 'package:genewisa_flutter/model/tempatwisata_model.dart';

import '../../theme/genewisa_text_theme.dart';
import '../widget/list_wisata_container.dart';
import 'detailwisata_view.dart';

class GenerateResultView extends StatefulWidget {
  GenerateResultView({Key? key}) : super(key: key);

  @override
  State<GenerateResultView> createState() => _GenerateResultViewState();
}

class _GenerateResultViewState extends State<GenerateResultView> {
  final List<TempatWisata> _allWisata = [
    TempatWisata("1", "Wisata 1", "Bandung", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("2", "Wisata 2", "Jakarta", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("3", "Wisata 3", "Bali", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
  ];

  List<TempatWisata> _foundWisata = [];
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
                          nama: _foundWisata[index].name.toString(),
                          lokasi: _foundWisata[index].city.toString(),
                          url: _foundWisata[index].pictureUrl.toString(),
                          rating: _foundWisata[index].rating,
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
