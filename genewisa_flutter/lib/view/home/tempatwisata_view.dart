import 'package:flutter/material.dart';
import 'package:genewisa_flutter/model/review_model.dart';
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
  late final List<Review> _allReview = <Review>[];

  void _fetchTempatWisata() async {
    final response = await CallApi().getData('tempat-wisata/');
    final responseReview = await CallApi().getData('review/');
    if (response.statusCode == 200 && responseReview.statusCode == 200) {
      List result = jsonDecode(response.body)['data'];
      List resultReviews = jsonDecode(responseReview.body)['data'];
      setState(() {
        double rating = 0;
        var reviews = <Review>[];
        for (Map<String, dynamic> element in resultReviews) {
          Review review = Review.fromJson(element);
          _allReview.add(review);
        }

        for (Map<String, dynamic> element in result) {
          TempatWisata tempatWisata = TempatWisata.fromJson(element);
          reviews = _allReview
            .where((element) => element.id_tempatwisata == tempatWisata.id)
            .toList();
          if (reviews.isNotEmpty) {
            rating = reviews.fold<double>(0, (double sum, dynamic item) => sum + item.rating).toDouble() / reviews.length.toDouble();
            tempatWisata.rating = rating;
          }
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
    super.initState();
    _fetchTempatWisata();
    _foundWisata = _allWisata;
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
              child: RefreshIndicator(
                onRefresh: () async { 
                  setState(() {
                    _fetchTempatWisata();
                    _foundWisata = _allWisata;
                  });
                },
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
                  ),)
            ),
          ],
        ),
      ),
    );
  }
}