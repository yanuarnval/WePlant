import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/screens/details_page/details_page.dart';

import 'package:mobile_flutter/shared/color_weplant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchBoxTxt;
  static const List<String> listCategory = [
    "Top Picks",
    "Indoor",
    "Garden",
    "Flower",
    "Indoor",
    "Garden",
  ];

  static const List<String> listImgMostWanted = [
    "pendek1.png",
    "pendek2.png",
    "tinggi1.png",
    "tinggi2.png",
    "pendek2.png",
    "tinggi1.png",
  ];

  int listclick = 0;
  @override
  void initState() {
    // TODO: implement initState
    _searchBoxTxt = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildHello(),
              _buildSliderEvent(),
              _buildSearchCard(),
              _buildListCategory(),
              _buildCategoryItem(context),
              _buildMostwanted(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildMostwanted(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Wanted',
                style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Text(
                'See More',
                style: GoogleFonts.workSans(
                    fontSize: 17, color: ColorsWeplant.colorPrimary),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.height *
                      0.9,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 8),
              itemCount: listImgMostWanted.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 100),
              itemBuilder: (context, index) => Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            (index % 2 == 0)
                                ? 'assets/mostwanted/tinggi1.png'
                                : 'assets/mostwanted/pendek1.png',
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Text(
                            'Indoor',
                            style: GoogleFonts.workSans(
                                color: ColorsWeplant.colorTxtSearch),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Peace Lily ${index}',
                            style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            'The peace lily plant is well known for its air-purifying abilities as a houseplant',
                            style: GoogleFonts.workSans(
                                color: ColorsWeplant.colorTxtSearch,
                                fontSize: 12),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("kota jakarta${index}")
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Icon(Icons.favorite_border),
                              Text(
                                'IDR 2${index}0.000',
                                style: GoogleFonts.workSans(
                                    fontWeight: FontWeight.w600,
                                    color: ColorsWeplant.colorPrimary),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
        ],
      ),
    );
  }

  Padding _buildSliderEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11.0,
      ),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext c, int index, int pageview) {
          return Image.asset(
            'assets/sale1.png',
          );
        },
        options: CarouselOptions(
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 1.9),
      ),
    );
  }

  Padding _buildHello() {
    return const Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Text(
        'Good morning',
      ),
    );
  }

  SingleChildScrollView _buildCategoryItem(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding:
          const EdgeInsets.only(left: 14.0, right: 14, bottom: 38.0, top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6 * 5.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsPage()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.97,
                child: Container(
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
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          (index % 2 == 0)
                              ? 'assets/plantimage1.png'
                              : 'assets/Image.png',
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.width * 0.4,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          'Indoor',
                          style: GoogleFonts.workSans(
                              color: ColorsWeplant.colorTxtSearch),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Peace Lily ${index}',
                          style: GoogleFonts.workSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          'The peace lily plant is well known for its air-purifying abilities as a houseplant',
                          style: GoogleFonts.workSans(
                              color: ColorsWeplant.colorTxtSearch,
                              fontSize: 12),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("kota jakarta${index}")
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Icon(Icons.favorite_border),
                            Text(
                              'IDR 2${index}0.000',
                              style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w600,
                                  color: ColorsWeplant.colorPrimary),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildListCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          listCategory.length,
          (index) => (index == listclick)
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      listclick = index;
                    });
                  },
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
                  onTap: () {
                    setState(() {
                      listclick = index;
                    });
                  },
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
                controller: _searchBoxTxt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
