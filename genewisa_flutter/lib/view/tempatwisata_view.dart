import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/widget/list_wisata_container.dart';

class TempatWisataView extends StatefulWidget {
  const TempatWisataView({Key? key}) : super(key: key);

  @override
  State<TempatWisataView> createState() => _TempatWisataViewState();
}

class _TempatWisataViewState extends State<TempatWisataView> {

  final List<Map<String, dynamic>> _allWisata = [
    {"id":1, "nama": "Wisata 1", "url": "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", "lokasi": "Bandung, Jawa Barat", "rating": 5 },
    {"id":2, "nama": "Wisata 2", "url": "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", "lokasi": "Bandung, Jawa Barat", "rating": 5 },
    {"id":3, "nama": "Wisata 3", "url": "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", "lokasi": "Bogor, Jawa Barat", "rating": 5 },
    {"id":4, "nama": "Wisata 4", "url": "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", "lokasi": "Bandung, Jawa Barat", "rating": 5 },
    {"id":5, "nama": "Wisata 5", "url": "https://images-ext-1.discordapp.net/external/lu8nnjiLKKaDDkoSD7_-J3XB4S3C90kwz8Qfp3nRVyk/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/428494356375404544/81c042163f6c8407b2f65e53b9d0c491.png?width=480&height=480", "lokasi": "Bandung, Jawa Barat", "rating": 5 },
  ];

  List<Map<String, dynamic>> _foundWisata = [];
  @override
  initState() {
    _foundWisata = _allWisata;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allWisata;
    } else {
      results = _allWisata
          .where((wisata) =>
              wisata["nama"].toLowerCase().contains(enteredKeyword.toLowerCase()) || wisata["lokasi"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                          nama: _foundWisata[index]["nama"].toString(),
                          lokasi: _foundWisata[index]["lokasi"].toString(),
                          url: _foundWisata[index]["url"].toString(),
                          rating: _foundWisata[index]["rating"],
                        ),
                        onTap: () {                          
                          Navigator.pushNamed(
                            context,
                            '/detailwisata',
                            arguments: _foundWisata[index],
                          );
                        },
                      ),
                    )
                  : const Text(
                      'Pencarian tidak ditemukan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}