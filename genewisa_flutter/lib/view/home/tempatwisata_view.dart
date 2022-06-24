import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../model/tempatwisata_model.dart';
import '../../api/api.dart';
import '../../view/home/detailwisata_view.dart';
import '../../theme/genewisa_text_theme.dart';
import '../widget/list_wisata_container.dart';

class TempatWisataView extends StatefulWidget {
  const TempatWisataView({Key? key}) : super(key: key);

  @override
  State<TempatWisataView> createState() => _TempatWisataViewState();
}

class _TempatWisataViewState extends State<TempatWisataView> {

  late final List<TempatWisata> _allWisata = <TempatWisata>[];

  void _fetchTempatWisata() async {
    final response = await CallApi().getData('tempat-wisata/');
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)['data'];
      setState(() {
        for (Map<String, dynamic> element in result) {
          TempatWisata tempatWisata = TempatWisata.fromJson(element);
          _allWisata.add(tempatWisata);
        }
      });
    } else {
      throw Exception('Failed to load tempat wisata');
    }
  }

  List<TempatWisata> _foundWisata = [];
  @override
  initState() {
    _fetchTempatWisata();
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
                        rating: _foundWisata[index].rating.toDouble(),
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