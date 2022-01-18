import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

import 'package:mobile_flutter/theme/weplant_theme.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({Key? key}) : super(key: key);
  static const List<String> listCategory = [
    "Top Picks",
    "Indoor",
    "Garden",
    "Flower",
    "Indoor",
    "Garden",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildSliderEvent(),
            _buildSearchCard(),
            _buildListCategory(),
            _buildSingleChildScrollView(context),
            _buildContainer(context)
          ],
        ),
      ),
    );
  }

  Padding _buildSliderEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11.0,
      ),
      child: CarouselSlider.builder(
        itemCount: 1,
        itemBuilder: (BuildContext c, int index, int pageview) {
          return Image.asset(
            'assets/images/sale1.png',
          );
        },
        options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 3),
            enableInfiniteScroll: false,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            viewportFraction: 1,
            aspectRatio: 1.9),
      ),
    );
  }

  SingleChildScrollView _buildListCategory() {
    int listclick = 0;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          listCategory.length,
          (index) => (index == listclick)
              ? GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    color: ColorsWeplant.colorPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        listCategory[index],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    color: ColorsWeplant.colorSearchBox,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        listCategory[index],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Card(
        elevation: 0,
        color: ColorsWeplant.colorSearchBox,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.fromLTRB(12, 0, 5, 0),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 22,
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle:
                      GoogleFonts.workSans(color: ColorsWeplant.colorTxtSearch),
                ),
                autofocus: false,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }


  SingleChildScrollView _buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45 * 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 9))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      child: Container(
                        color: Colors.grey[300],
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SkeletonAnimation(
                        shimmerColor: Colors.grey,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    SkeletonAnimation(
                        shimmerColor: Colors.grey,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        )),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width * 0.44,
                    child: Text(
                      'Best plant of week',
                      style: WeplantTheme.textTheme.headline1,
                    ),
                  ),
                  Column(
                    children: List.generate(
                        4,
                        (index) => Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(24)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 15,
                                      offset: const Offset(0, 9))
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SkeletonAnimation(
                                      shimmerColor: Colors.grey,
                                      child: Container(
                                        color: Colors.grey[300],
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      ),
                                    ),
                                    const SizedBox(height: 6,),
                                    SkeletonAnimation(
                                      shimmerColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.grey[300]),
                                      )
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SkeletonAnimation(
                                      shimmerColor: Colors.grey,
                                      child:  Container(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.grey[300]),
                                      )
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    SkeletonAnimation(
                                      shimmerColor: Colors.grey,
                                      child:  Container(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.grey[300]),
                                      )
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),

                                  ],
                                ),
                              ),
                            )),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                    4,
                    (index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 15,
                                    offset: const Offset(0, 9))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SkeletonAnimation(
                                    shimmerColor: Colors.grey,
                                    child: Container(
                                      color: Colors.grey[300],
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                    ),
                                  ),
                                  const SizedBox(height: 6,),
                                  SkeletonAnimation(
                                    shimmerColor: Colors.grey,
                                    child:  Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Colors.grey[300]),
                                    )
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SkeletonAnimation(
                                      shimmerColor: Colors.grey,
                                      child:
                                      Container(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.grey[300]),
                                      )),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  SkeletonAnimation(
                                    shimmerColor: Colors.grey,
                                    child:  Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Colors.grey[300]),
                                    )
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
