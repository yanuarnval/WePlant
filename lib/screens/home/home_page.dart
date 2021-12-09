import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_flutter/weplant_theme.dart';

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
              _buildCategoryItem(context)
            ],
          ),
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
        itemCount: 3,
        itemBuilder: (BuildContext c, int index, int pageview) {
          return Image.asset(
            'assets/sale1.png',
          );
        },
        options: CarouselOptions(
            autoPlay: true, viewportFraction: 1, aspectRatio: 1.9),
      ),
    );
  }

  Padding _buildHello() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        'Good morning',
        style: WeplantTheme.lightTextTheme.headline2,
      ),
    );
  }

  SingleChildScrollView _buildCategoryItem(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6 * 5.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.96,
              child: Container(
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
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
                        'assets/plantimage1.png',
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
                            color: WeplantTheme.colorTxtSearch),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        'Peace Lily ${index}',
                        style: GoogleFonts.workSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        'The peace lily plant is well known for its air-purifying abilities as a houseplant',
                        style: GoogleFonts.workSans(
                            color: WeplantTheme.colorTxtSearch, fontSize: 13),
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
                                color: WeplantTheme.colorPrimary),
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
    );
  }

  SingleChildScrollView _buildListCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
                    color: WeplantTheme.colorPrimary,
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
                    color: WeplantTheme.colorSearchBox,
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
        color: WeplantTheme.colorSearchBox,
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
              icon: Image.asset(
                'assets/icons/search.png',
                width: 22,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle:
                      GoogleFonts.workSans(color: WeplantTheme.colorTxtSearch),
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
