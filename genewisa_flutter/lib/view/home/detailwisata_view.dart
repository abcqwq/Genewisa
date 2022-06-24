import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genewisa_flutter/api/api.dart';
import '../../../model/tempatwisata_model.dart';
import '../../utils/PreferenceGlobal.dart';
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

  @override
  initState() {
    _getIsaved();
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
            SingleChildScrollView(
              clipBehavior: Clip.antiAlias,
              child: ListDeskripsiWisataContainer(
                title: "Deskripsi",
                deskripsi: widget.foundWisata.description,
              ),
            ),
            ListReviewContainer(
                nama: "Aldo",
                deskripsi:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dictum euismod leo Lorem ipsum dolor sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit.",
                rating: 5,
                url:
                    "https://images-ext-2.discordapp.net/external/ZayLKwlpb-DfZ8j9oobtSKa4Xv5rDU6-5k4NPZvMRfQ/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/432610292342587392/29cb28fbf65a3958105026ab03abd306.png?width=480&height=480"),
            SizedBox(height: 50),
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
}
