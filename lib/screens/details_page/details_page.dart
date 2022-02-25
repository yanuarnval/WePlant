import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/cart_bloc.dart';
import 'package:mobile_flutter/bloc/details_bloc.dart';
import 'package:mobile_flutter/cart/cart_page.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_state.dart';
import 'package:mobile_flutter/model/details_event.dart';
import 'package:mobile_flutter/model/details_model.dart';
import 'package:mobile_flutter/model/details_state_model.dart';
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/screens/chat/message_page.dart';
import 'package:mobile_flutter/screens/loadingScreens/details_page_loading.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class DetailsPage extends StatefulWidget {
  String idproduct;

  DetailsPage({Key? key, required this.idproduct}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int jmlhBarang = 1;
  int _current = 0;
  bool _isLoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<DetailsBloc>(
                  create: (_) => DetailsBloc(widget.idproduct)),
              BlocProvider<CartBloc>(create: (_) => CartBloc())
            ],
            child:
            BlocListener<CartBloc, CartState>(
              listener: (context, state) {
                if (state is LoadingCartState) {
                  _isLoding = true;
                }
                if (state is SuccesLoadCartState) {
                  _isLoding=false;
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext c) => CartsPage()));
                }
              },
              child: BlocBuilder<DetailsBloc, DetailsState>(
                  builder: (context, state) {
                    if (state is InitialDetailsState) {
                      context.read<DetailsBloc>().add(getProductById());
                    }
                    if (state is SuccesLoadAllDetailsState) {
                      return _buildMainContent(context, state);
                    } else {
                      return const DetailsPageLoading();
                    }
                  }),
            ),
          )),
    );
  }

  Stack _buildMainContent(BuildContext context,
      SuccesLoadAllDetailsState state) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _buildImageSlider(context, state.detailsModel),
              _buildContent(state.detailsModel, state.merchantModel),
            ],
          ),
        ),
        Positioned(top: 0, left: 0, right: 0, child: _buildHeader(context)),
        buildAddCartAndChatBtn(context, state.merchantModel),
        BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return (_isLoding)
              ? Container(
            color: Colors.grey.withOpacity(0.2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
              : const SizedBox();
        })
      ],
    );
  }

  Positioned buildAddCartAndChatBtn(BuildContext context,
      MerchantModel merchantModel) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.75,
            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(AddProductToCart(
                    widget.idproduct,
                  ));
                },
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              );
            }),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext c) =>
                          MessagePage(
                            emailMerchant: merchantModel.email,
                          )));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: ColorsWeplant.colorPrimary, shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/chat_icon.png',
                width: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildImageSlider(BuildContext context, DetailsModel detailsModel) {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: detailsModel.images!.length,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            itemBuilder: (context, index) =>
                Image.network(
                  detailsModel.images?[index]['url'],
                  fit: BoxFit.cover,
                ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  detailsModel.images!.length,
                      (index) =>
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (_current == index)
                                ? Colors.white
                                : Colors.white30),
                      )),
            ),
          )
        ],
      ),
    );
  }

  Container _buildContent(DetailsModel detailsModel,
      MerchantModel merchantModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
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
            detailsModel.categories.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            detailsModel.name,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rp" + detailsModel.price.toString(),
                  style: GoogleFonts.workSans(
                      color: ColorsWeplant.colorPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: Image.network(
                      merchantModel.main_image['url'],
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      merchantModel.name,
                    ),
                    Text(
                      merchantModel.address['city'],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Description'),
          ),
          Text(detailsModel.description)
        ],
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
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
      ),
    );
  }
}
