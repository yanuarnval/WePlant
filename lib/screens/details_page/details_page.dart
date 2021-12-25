import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int jmlhBarang = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 370,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Image.asset(
                          'assets/mostwanted/contoh.jpg',
                          fit: BoxFit.contain,
                        )),
              ),
              Positioned(
                  left: 14.0,
                  top: 23,
                  right: 14.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('assets/icons/chevron-left.svg'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/shopping-bag.svg'),
                      )
                    ],
                  )),
              Positioned(
                top: 340,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 2)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HousePlant',
                        style: GoogleFonts.workSans(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: ColorsWeplant.colorTxtSearch),
                      ),
                      Text(
                        'Fiddle leaf fig plant',
                        style: GoogleFonts.workSans(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'IDR 20.000',
                            style: GoogleFonts.workSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: ColorsWeplant.colorPrimary),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: ColorsWeplant.colorSearchBox),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.minus,
                                      size: 14,
                                      color: ColorsWeplant.colorPrimary,
                                    )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '$jmlhBarang',
                                  style: GoogleFonts.workSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 14,
                                      color: ColorsWeplant.colorPrimary,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorsWeplant.colorSearchBox,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    'assets/icons/leaf.svg',
                                    width: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'About',
                                  style: GoogleFonts.workSans(),
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorsWeplant.colorSearchBox,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                'assets/icons/droplet.svg',
                                width: 24,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorsWeplant.colorSearchBox,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                'assets/icons/message-circle.svg',
                                width: 24,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorsWeplant.colorSearchBox,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                'assets/icons/heart.svg',
                                width: 24,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
