import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:genewisa_flutter/model/review_model.dart';
import 'package:genewisa_flutter/model/review_req_model.dart';
import '../../../model/tempatwisata_model.dart';
import '../../api/api.dart';
import '../../model/user_model.dart';
import '../../view/widget/detailwisata_app_bar.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/list_deskripsiwisata_container.dart';
import '../widget/list_review_container.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailWisataView extends StatefulWidget {
  final TempatWisata foundWisata;

  const DetailWisataView({
    Key? key,
    required this.foundWisata
  }) : super(key: key);

  @override
  State<DetailWisataView> createState() => _DetailWisataView();
}

class _DetailWisataView extends State<DetailWisataView> {

  List<Review> _wisataReview = <Review>[];
  late User _currentUser;
  Map<int, User> reviewMap = {};
  int _rating = 0;

  void _fetchReview(int id) async {
    final response = await CallApi().getData('review/');
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)['data']['data'];
      setState(() {
        for (Map<String, dynamic> element in result) {
          Review review = Review.fromJson(element);
          _wisataReview.add(review);
        }
        _wisataReview = _wisataReview.where((element) => element.id_tempatwisata == id).toList();
      });
    } else if (response.statusCode == 404){}
    else {
      throw Exception('Failed to load Review');
    }
  }
  void _fetchUser(String username, int id) async {
    final response = await CallApi().getData('user/' + username);
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body)['data'];
      reviewMap[id] = User.fromJson(result);
    } else {
      throw Exception('Failed to load User');
    }
  }

  void _postReview(ReviewRequest review, String path) async {
    final response = CallApi().postData(review, path);
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body)['data'];
      print(result);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchReview(widget.foundWisata.id);
    for (var element in _wisataReview) {
      _fetchUser(element.username, element.id);
    }
    print('checkpoint');
    print(reviewMap);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = widget.foundWisata;
    final textController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DetailWisataAppBar(foundWisata: arguments),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListDeskripsiWisataContainer(
                title: "Deskripsi",
                deskripsi: widget.foundWisata.description,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _wisataReview.length,
              itemBuilder: (context, idx) {
                return ListReviewContainer(
                  nama: reviewMap[_wisataReview[idx].id] != null ? reviewMap[_wisataReview[idx].id]!.firstName : 'default',
                  deskripsi:_wisataReview[idx].comment,
                  rating: _wisataReview[idx].rating.toDouble(),
                  url:reviewMap[_wisataReview[idx].id] != null ? reviewMap[_wisataReview[idx].id]!.img : 'default', 
                );
                //const SizedBox(height: 50);
                // return ListReviewContainer(
                //   nama: "Aldo",
                //   deskripsi:
                //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dictum euismod leo Lorem ipsum dolor sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit.",
                //   rating: 5,
                //   url:
                //       "https://images-ext-2.discordapp.net/external/ZayLKwlpb-DfZ8j9oobtSKa4Xv5rDU6-5k4NPZvMRfQ/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/432610292342587392/29cb28fbf65a3958105026ab03abd306.png?width=480&height=480"),
                // SizedBox(height: 50);
              },
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 53,
            decoration: GenewisaTheme.cancelButtonContainer(),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Container(
                    height: 300,
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GenewisaTextTheme.textTheme.headline1,
                            children: <TextSpan>[
                              TextSpan(
                                text: arguments.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          arguments.city,
                          style: GenewisaTextTheme.textTheme.bodyText1,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              style: GenewisaTextTheme.textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Review",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            _rating = rating as int;
                          },
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: RichText(
                            text: TextSpan(
                              style: GenewisaTextTheme.textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Deskripsi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        TextField(
                          controller: textController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          style: GenewisaTextTheme.textTheme.bodyText1,
                          decoration: InputDecoration(
                              hintText: "Masukkan Deskripsi",
                              hintStyle: GenewisaTextTheme.textTheme.bodyText1,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xFF9FACE6)))),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 53,
                          decoration: GenewisaTheme.cancelButtonContainer(),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: GenewisaTheme.geneButton(),
                            child: Text(
                              'Batal',
                              style: GenewisaTextTheme.textTheme.button,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 53,
                          decoration: GenewisaTheme.buttonContainer(),
                          child: ElevatedButton(
                            onPressed: () {
                              _postReview(
                                ReviewRequest(
                                  "aa",
                                  widget.foundWisata.id,
                                  _rating,
                                  textController.text,
                                ), 'review'
                              );
                              Navigator.pop(context);
                            },
                            style: GenewisaTheme.geneButton(),
                            child: Text(
                              'Simpan',
                              style: GenewisaTextTheme.textTheme.button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              style: GenewisaTheme.geneButton(),
              child: Text(
                'Beri Review',
                style: GenewisaTextTheme.textTheme.button,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 53,
            decoration: GenewisaTheme.buttonContainer(),
            child: ElevatedButton(
              onPressed: () {},
              style: GenewisaTheme.geneButton(),
              child: Text(
                'Simpan',
                style: GenewisaTextTheme.textTheme.button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
