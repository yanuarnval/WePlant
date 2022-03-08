import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_flutter/bloc/for%20ui/main_screen_bloc.dart';
import 'package:mobile_flutter/screens/transaksi_page.dart';
import 'package:mobile_flutter/screens/home/home_page.dart';
import 'package:mobile_flutter/screens/cart/cart_page.dart';
import 'package:mobile_flutter/screens/profil/profil_page.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> pages = <Widget>[
    const HomePage(),
    const ProfilPage(),
    const ProfilPage(),
    const ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainScreenBloc>(
        create: (_) => MainScreenBloc(),
        child: BlocBuilder<MainScreenBloc, int>(builder: (context, value) {
          return Stack(
            children: [
              pages[value],
              _buildBottomNavigationbar(context, value),
            ],
          );
        }),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Positioned _buildBottomNavigationbar(BuildContext context, int value) {
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
              currentIndex: value,
              onTap: (index) {
                context.read<MainScreenBloc>().changeIndex(index);
              }),
        ),
      ),
    );
  }
}
