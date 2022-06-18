import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../view/home/generate_view.dart';
import '../../theme/genewisa_text_theme.dart';
import 'saved_view.dart';
import 'tempatwisata_view.dart';
import 'profile_view.dart';
import '../widget/home_app_bar.dart';

class HomeCardMenu extends StatefulWidget {
  final String? sm_text;
  final String lg_text, img;
  final int color;

  const HomeCardMenu(
      {Key? key,
      required this.sm_text,
      required this.lg_text,
      required this.img,
      required this.color})
      : super(key: key);

  @override
  State<HomeCardMenu> createState() => _HomeCardMenuState();
}

class _HomeCardMenuState extends State<HomeCardMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 142,
        height: 228,
        decoration: BoxDecoration(
            color: Color(widget.color), borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  widget.img,
                  allowDrawingOutsideViewBox: true,
                  //clipBehavior: Clip,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              //alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 18, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sm_text == null ? "" : widget.sm_text.toString(),
                    style: GenewisaTextTheme.textTheme.headline4,
                  ),
                  Text(
                    widget.lg_text,
                    style: GenewisaTextTheme.textTheme.headline3,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: HomeCardMenu(
                  sm_text: "Generate",
                  lg_text: "Wisata",
                  img: "generate_wisata_card.svg",
                  color: 0xFFFFEE57,
                ),
                onTap: () {
                  _onItemTapped(1);
                },
              ),
              InkWell(
                child: HomeCardMenu(
                  sm_text: "Tempat",
                  lg_text: "Wisata",
                  img: "tempat_wisata_card.svg",
                  color: 0xFFFFAEAE,
                ),
                onTap: () {
                  _onItemTapped(2);
                },
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: HomeCardMenu(
                    sm_text: "Saved",
                    lg_text: "Wisata",
                    img: "saved_wisata_card.svg",
                    color: 0xFFBBBAFF,
                  ),
                  onTap: () {
                    _onItemTapped(3);
                  },
                ),
                InkWell(
                  child: HomeCardMenu(
                    sm_text: null,
                    lg_text: "Profile",
                    img: "profile_card.svg",
                    color: 0xFFD9D9D9,
                  ),
                  onTap: () {
                    _onItemTapped(4);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ),
    GenerateView(),
    TempatWisataView(),
    SavedView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/home_icon.svg',
              semanticsLabel: 'Home Icon',
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/home_active_icon.svg',
              semanticsLabel: 'Home Icon',
              width: 30,
              height: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/generate_icon.svg',
              semanticsLabel: 'Generate Icon',
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/generate_active_icon.svg',
              semanticsLabel: 'Generate Icon',
              width: 30,
              height: 30,
            ),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/search_icon.svg',
              semanticsLabel: 'Search Icon',
              width: 28.5,
              height: 28.5,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/search_active_icon.svg',
              semanticsLabel: 'Search Icon',
              width: 28.5,
              height: 28.5,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/saved_icon.svg',
              semanticsLabel: 'Saved Icon',
              width: 27,
              height: 27,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/saved_active_icon.svg',
              semanticsLabel: 'Saved Icon',
              width: 27,
              height: 27,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/profile_icon.svg',
              semanticsLabel: 'Profile Icon',
              width: 28,
              height: 28,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/profile_active_icon.svg',
              semanticsLabel: 'Profile Icon',
              width: 28,
              height: 28,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
