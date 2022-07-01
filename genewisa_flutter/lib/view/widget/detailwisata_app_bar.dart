import 'package:flutter/material.dart';
import 'package:genewisa_flutter/model/tempatwisata_model.dart';
import '../../theme/genewisa_text_theme.dart';

class DetailWisataAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TempatWisata foundWisata;
  final bool showRating;

  const DetailWisataAppBar({
    Key? key,
    required this.foundWisata, required this.showRating
  }) : preferredSize = const Size.fromHeight(250.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final arguments = foundWisata;

    return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 250,
        leadingWidth: 100,
        flexibleSpace: Stack(
          children: <Widget>[
            Container(
              height: 249,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(arguments.pictureUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 260,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(1)
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GenewisaTextTheme.textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(
                            text: arguments.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Text(
                    arguments.city,
                    style: GenewisaTextTheme.textTheme.bodyText1,
                  ),
                  RichText(
                    text: TextSpan(
                      style: GenewisaTextTheme.textTheme.headline2,
                      children: <TextSpan>[
                        (showRating) 
                        ? const TextSpan(
                            text: "Rating : ",
                            style: TextStyle(fontWeight: FontWeight.bold))
                        : const TextSpan(text: ""),
                        (showRating) ? TextSpan(text: arguments.rating.toString()) : const TextSpan(text: ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
  }
}