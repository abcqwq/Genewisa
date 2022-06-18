import 'package:flutter/material.dart';
import '../../view/widget/detailwisata_app_bar.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/list_deskripsiwisata_container.dart';
import '../widget/list_review_container.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailWisataView extends StatefulWidget {
  const DetailWisataView({Key? key}) : super(key: key);

  @override
  State<DetailWisataView> createState() => _DetailWisataView();
}

class _DetailWisataView extends State<DetailWisataView> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final textController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DetailWisataAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListDeskripsiWisataContainer(
                title: "Deskripsi",
                deskripsi:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dictum euismod leo Lorem ipsum dolor sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit. sit amet, consectetur adipiscing elit."),
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
                                text: arguments['nama'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          arguments['lokasi'],
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
