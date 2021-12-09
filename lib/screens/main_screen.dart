import 'package:flutter/material.dart';
import 'package:mobile_flutter/screens/favorit_page.dart';
import 'package:mobile_flutter/screens/home/home_page.dart';
import 'package:mobile_flutter/screens/keranjang.dart';
import 'package:mobile_flutter/screens/profil_page.dart';
import 'package:mobile_flutter/weplant_theme.dart';

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
    const KeranjangPage(),
    const ProfilPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: pages,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: WeplantTheme.colorBottomNav,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/icons/home_icon.png",
                    width: 22,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/icons/favorit_icon.png",
                    width: 22,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/icons/keranjang_icon.png",
                    width: 22,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/icons/profil_icon.png",
                    width: 22,
                  ),
                )
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
