import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_flutter/screens/favorit_page.dart';
import 'package:mobile_flutter/screens/home/home_page.dart';
import 'package:mobile_flutter/cart/cart_page.dart';
import 'package:mobile_flutter/screens/profil/profil_page.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  static List<Widget> pages = <Widget>[
    const HomePage(),
    const FavoritPage(),
    const CartsPage(),
    const ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[_selectedPage],
          _buildBottomNavigationbar(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Positioned _buildBottomNavigationbar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, -3),
          ),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme:
                  const IconThemeData(color: ColorsWeplant.colorPrimary),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    label: "",
                    icon: FaIcon(
                      FontAwesomeIcons.store,
                      size: 20,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: FaIcon(
                      FontAwesomeIcons.newspaper,
                      size: 20,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: FaIcon(
                      FontAwesomeIcons.shoppingBag,
                      size: 20,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: FaIcon(
                      FontAwesomeIcons.userAlt,
                      size: 20,
                    )),
              ],
              currentIndex: _selectedPage,
              onTap: onItemTapped),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
