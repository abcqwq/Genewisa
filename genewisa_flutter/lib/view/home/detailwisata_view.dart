import 'dart:convert';

import 'package:flutter/material.dart';
import '../../api/api.dart';
import '../../../model/tempatwisata_model.dart';
import '../../utils/PreferenceGlobal.dart';
import '../../../model/review_model.dart';
import '../../model/review_req_model.dart';
import '../../model/user_model.dart';
import '../../view/widget/detailwisata_app_bar.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/list_deskripsiwisata_container.dart';
import '../widget/list_review_container.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailWisataView extends StatefulWidget {
  final TempatWisata foundWisata;

  const DetailWisataView({Key? key, required this.foundWisata})
      : super(key: key);

  @override
  State<DetailWisataView> createState() => _DetailWisataView();
}

class _DetailWisataView extends State<DetailWisataView> {
  bool _isSaved = false;
  String? username;
  _showMsg(msg, Color clr) {
    //
    final snackBar = SnackBar(
      backgroundColor: clr,
      content: Text(msg, style: GenewisaTextTheme.textTheme.headline4),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Tutup',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _getIsaved() async {
    username = PreferenceGlobal.getPref().getString('username');
    var res = await CallApi().getData('saved?username=' +
        (username ?? '') +
        '&id_tempatwisata=' +
        (widget.foundWisata.id.toString()));
    var body = json.decode(res.body);
    setState(() {
      if (body['data'].length == 0) {
        _isSaved = false;
      } else {
        _isSaved = true;
      }
    });
  }

  List<Review> _wisataReview = <Review>[];
  late User _currentUser;
  Map<int, User> reviewMap = {};
  double _rating = 0;

  void _fetchReview(int id) async {
    final response = await CallApi().getData('review/');
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)['data'];
      setState(() {
        for (Map<String, dynamic> element in result) {
          Review review = Review.fromJson(element);
          _wisataReview.add(review);
        }
        _wisataReview = _wisataReview
            .where((element) => element.id_tempatwisata == id)
            .toList();
      });
    } else if (response.statusCode == 404) {
    } else {
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
    }
  }

  void _save(id) async {
    var data = {
      'username': PreferenceGlobal.getPref().getString('username'),
      'id_tempatwisata': id,
    };
    if (!_isSaved) {
      var res = await CallApi().postData(data, 'saved/');
      var body = json.decode(res.body);
    } else if (_isSaved) {
      var res = await CallApi().deleteData(data, 'saved/');
      var body = json.decode(res.body);
    }
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  void initState() {
    super.initState();
    _getIsaved();
    _fetchReview(widget.foundWisata.id);
    for (var element in _wisataReview) {
      _fetchUser(element.username, element.id);
    }
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
                    nama: reviewMap[_wisataReview[idx].id]?.firstName ?? '',
                    deskripsi: _wisataReview[idx].comment,
                    rating: _wisataReview[idx].rating.toDouble(),
                    url: reviewMap[_wisataReview[idx].id] != null
                        ? reviewMap[_wisataReview[idx].id]!.img
                        : 'default');
              },
            ),
            const SizedBox(height: 60,)
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 53,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: GenewisaTheme.cancelButtonContainer(),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Container(
                    height: 300,
                    constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GenewisaTextTheme.textTheme.headline2,
                            children: <TextSpan>[
                              TextSpan(
                                text: arguments.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
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
                              children: const <TextSpan>[
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
                          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            _rating = rating;
                          },
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: RichText(
                            text: TextSpan(
                              style: GenewisaTextTheme.textTheme.bodyText1,
                              children: const <TextSpan>[
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
                                    PreferenceGlobal.getPref()
                                            .getString('username') ??
                                        '',
                                    widget.foundWisata.id,
                                    _rating,
                                    textController.text,
                                  ),
                                  'review');
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
            margin: const EdgeInsets.only(bottom: 20),
            decoration: GenewisaTheme.buttonContainer(),
            child: ElevatedButton(
              onPressed: () {
                _save(widget.foundWisata.id);
              },
              style: GenewisaTheme.geneButton(),
              child: Text(
                _isSaved ? 'Tersimpan' : 'Simpan',
                style: GenewisaTextTheme.textTheme.button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
