import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genewisa_flutter/model/recommendation_model.dart';
import 'package:genewisa_flutter/model/tempatwisata_model.dart';

import '../../api/api.dart';
import '../../theme/genewisa_text_theme.dart';
import '../widget/list_wisata_container.dart';
import '../widget/list_wisata_recommendation_container.dart';
import 'detailwisata_view.dart';

class GenerateResultView extends StatefulWidget {
  GenerateResultView({Key? key, required this.recommendation})
      : super(key: key);
  Recommendation recommendation;

  @override
  State<GenerateResultView> createState() => _GenerateResultViewState();
}

class _GenerateResultViewState extends State<GenerateResultView> {
  late List<TempatWisata> _allWisata = <TempatWisata>[];

  void _postReview(Recommendation recommendation) async {
    final res = await CallApi()
        .postData(recommendation, "tempat-wisata-recommendation");
    var body = json.decode(res.body);
    if (body['status'] == 'OK') {
      List result = body['data'];
      setState(() {
        for (Map<String, dynamic> element in result) {
          TempatWisata tempatWisata = TempatWisata.fromJson(element);
          _allWisata.add(tempatWisata);
        }
      });
    }
  }

  List<TempatWisata> _foundWisata = [];
  @override
  initState() {
    _postReview(widget.recommendation);
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
                        child: ListWisataRContainer(
                          nama: _foundWisata[index].name.toString(),
                          lokasi: _foundWisata[index].city.toString(),
                          url: _foundWisata[index].pictureUrl.toString(),
                          estPrice: _foundWisata[index].price,
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
                                  builder: (context) => DetailWisataView(
                                      foundWisata: _foundWisata[index])));
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
