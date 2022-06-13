import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../view/profile_view.dart';
import '../view/widget/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text(
      'Index 1: Generate',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Saved',
      style: optionStyle,
    ),
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
              width: 28,
              height: 28,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/home_active_icon.svg',
              semanticsLabel: 'Home Icon',
              width: 28,
              height: 28,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/generate_icon.svg',
              semanticsLabel: 'Generate Icon',
              width: 28,
              height: 28,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/generate_active_icon.svg',
              semanticsLabel: 'Generate Icon',
              width: 28,
              height: 28,
            ),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/search_icon.svg',
              semanticsLabel: 'Search Icon',
              width: 28,
              height: 28,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/search_active_icon.svg',
              semanticsLabel: 'Search Icon',
              width: 28,
              height: 28,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '/navbar/inactive/saved_icon.svg',
              semanticsLabel: 'Saved Icon',
              width: 28,
              height: 28,
            ),
            activeIcon: SvgPicture.asset(
              '/navbar/active/saved_active_icon.svg',
              semanticsLabel: 'Saved Icon',
              width: 28,
              height: 28,
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
        selectedItemColor: Color(0xFF9FACE6),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 142,
                height: 228,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEE57),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  //alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Generate"),
                      Text("Wisata", style: TextStyle(fontSize: 24),)
                    ],
                  ),
                ),
              ),
              Container(
                width: 142,
                height: 228,
                decoration: BoxDecoration(
                    color: Color(0xFFFFAEAE),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  //alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tempat"),
                      Text("Wisata", style: TextStyle(fontSize: 24),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 142,
                  height: 228,
                  decoration: BoxDecoration(
                      color: Color(0xFFBBBAFF),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Container(
                    //alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Saved"),
                        Text("Wisata", style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 142,
                  height: 228,
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Container(
                    //alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Profil", style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}