import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/home_bloc.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/model/product_state_model.dart';
import 'package:mobile_flutter/model/product_model.dart';
import 'package:mobile_flutter/screens/chat/list_user_page.dart';
import 'package:mobile_flutter/screens/chat/message_page.dart';
import 'package:mobile_flutter/screens/details_page/details_page.dart';
import 'package:mobile_flutter/screens/loadingScreens/home_page_loading.dart';

import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldState = GlobalKey<ScaffoldState>();

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
        child: BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
          child: BlocListener<HomeBloc, ProductState>(
            listener: (_, state) {
              if (state is FailureLoadProductState) {
                print('error listener $state');
              }
              if (state is LoadingProductState) {
                print('loading');
              }
            },
            child: BlocBuilder<HomeBloc, ProductState>(
              builder: (context, state) {
                if (state is InitialProductState) {
                  context.read<HomeBloc>().add(getDataFromApi());
                }
                if (state is SuccesLoadAllProductState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        _buildHello(),
                        _buildSliderEvent(),
                        _buildSearchCard(),
                        _buildListCategory(),
                        _buildCategoryItem(context, state.listProduct),
                        _buildMostwanted(context, state.listProduct),
                      ],
                    ),
                  );
                } else {
                  return const HomePageLoading();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Container _buildMostwanted(
      BuildContext context, List<ProductModel> listMostwanted) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 60, top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width * 0.44,
                child: const Text(
                  'Most Wanted',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'See',
                    style: TextStyle(
                        fontSize: 17, color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    children: List.generate(
                        listMostwanted.length,
                        (index) => GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        listMostwanted[index].imagesModel,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        'Indoor',
                                        style: GoogleFonts.workSans(
                                            color: ColorsWeplant.colorTxtSearch,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        listMostwanted[index].name,
                                        style: GoogleFonts.workSans(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Rp${listMostwanted[index].price}',
                                        style: GoogleFonts.workSans(
                                            fontWeight: FontWeight.w600,
                                            color: ColorsWeplant.colorPrimary,
                                            fontSize: 13),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 22,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "kota jakarta${index}",
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                    listMostwanted.length,
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
                                  Image.network(
                                    listMostwanted[
                                            (listMostwanted.length - 1) - index]
                                        .imagesModel,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    fit: BoxFit.contain,
                                  ),
                                  const Text(
                                    'Indoor',
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    listMostwanted[
                                            (listMostwanted.length - 1) - index]
                                        .name,
                                    style: GoogleFonts.workSans(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Rp${listMostwanted[(listMostwanted.length - 1) - index].price}',
                                    style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w600,
                                        color: ColorsWeplant.colorPrimary,
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 22,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "kota jakarta${index}",
                                        style: const TextStyle(fontSize: 10),
                                      )
                                    ],
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

  Padding _buildSliderEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11.0,
      ),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext c, int index, int pageview) {
          return Image.asset(
            'assets/images/sale1.png',
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Good morning',
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ColorsWeplant.colorTextfield,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext c) => const ListUserPage()));
              },
              icon: const Icon(
                FontAwesomeIcons.envelope,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildCategoryItem(
      BuildContext context, List<ProductModel> listProduct) {
    return Container(
      color: Colors.white,
      height: 350,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listProduct.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((BuildContext c, i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext c) =>
                          DetailsPage(idproduct: listProduct[i].id)));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                  left: 15,
                  right: (i == listProduct.length) ? 15 : 0),
              width: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: const Offset(0, 9))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      listProduct[i].imagesModel,
                      fit: BoxFit.cover,
                      width: 160,
                      height: 160,
                    ),
                    const Spacer(),
                    Text(
                      (listProduct[i].name.length >= 15)
                          ? listProduct[i].name.substring(0, 15)
                          : listProduct[i].name,
                      style: GoogleFonts.workSans(
                          color: const Color(0xff24243F),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      (listProduct[i].description.length >= 47)
                          ? listProduct[i].description.substring(0, 47).trim() +
                              '...'
                          : listProduct[i].description,
                      style: GoogleFonts.workSans(
                          color: const Color(0xff888E9A),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'stock(${listProduct[i].stock})',
                          style: const TextStyle(
                              color: Color(0xff24243F), fontSize: 12),
                        ),
                        Text(
                          'IDR ${listProduct[i].price}',
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.w600,
                              color: ColorsWeplant.colorPrimary,
                              fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
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
