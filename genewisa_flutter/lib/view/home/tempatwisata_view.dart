import 'package:flutter/material.dart';
import '../../../model/tempatwisata_model.dart';
import '../../view/home/detailwisata_view.dart';
import '../../theme/genewisa_text_theme.dart';
import '../widget/list_wisata_container.dart';

class TempatWisataView extends StatefulWidget {
  const TempatWisataView({Key? key}) : super(key: key);

  @override
  State<TempatWisataView> createState() => _TempatWisataViewState();
}

class _TempatWisataViewState extends State<TempatWisataView> {

  final List<TempatWisata> _allWisata = <TempatWisata>[
    TempatWisata("1", "Wisata 1", "Bandung", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("2", "Wisata 2", "Jakarta", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("3", "Wisata 3", "Bali", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("4", "Wisata 4", "Bogor", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
    TempatWisata("5", "Wisata 5", "Bekasi", "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", 5, "description"),
  ];

  List<TempatWisata> _foundWisata = [];
  @override
  initState() {
    _foundWisata = _allWisata;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<TempatWisata> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allWisata;
    } else {
      results = _allWisata
          .where((wisata) =>
              wisata.name.toLowerCase().contains(enteredKeyword.toLowerCase()) 
              || wisata.city.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundWisata = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30, top: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            TextField(
              style: GenewisaTextTheme.textTheme.bodyText1,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.black,),
                labelText: 'Search',
                labelStyle: GenewisaTextTheme.textTheme.bodyText1,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
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