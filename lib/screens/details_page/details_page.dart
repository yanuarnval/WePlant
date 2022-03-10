import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/cart_bloc.dart';
import 'package:mobile_flutter/bloc/details_bloc.dart';
import 'package:mobile_flutter/screens/cart/cart_page.dart';
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
        child: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state is LoadingCartState) {
              _isLoding = true;
            }
            if (state is FailureLoadCartState) {
              _isLoding = false;
              _showDialog(state.errorMessage);
            }
            if (state is SuccesLoadPostCartState) {
              _isLoding = false;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext c) => const CartsPage()));
            }if(state is SuccesLoadCartState){
              _isLoding=false;
            }
          },
          child:
              BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
            if (state is InitialDetailsState) {
              context.read<DetailsBloc>().add(getProductById());
              context.read<CartBloc>().add(GetProductsFromCart());
            }
            if (state is SuccesLoadAllDetailsState) {
              print(state.detailsModel.images![0]);
              return _buildMainContent(context, state);
            } else {
              return const DetailsPageLoading();
            }
          }),
        ),
      )),
    );
  }

  Stack _buildMainContent(
      BuildContext context, SuccesLoadAllDetailsState state) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  _buildHeader(context),
                  _buildImageSlider(context, state.detailsModel),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.64,
                  left: 0,
                  right: 0,
                  child:
                      _buildContent(state.detailsModel, state.merchantModel)),
            ],
          ),
        ),
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

  Positioned buildAddCartAndChatBtn(
      BuildContext context, MerchantModel merchantModel) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
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
                      builder: (BuildContext c) => MessagePage(
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

  SizedBox _buildImageSlider(BuildContext context, DetailsModel detailsModel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height + 460,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: detailsModel.images!.length,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (context, index) => Image.network(
                detailsModel.images?[index]['url'],

              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.54,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                detailsModel.images!.length,
                (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: (_current == index) ? 25 : 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (_current == index)
                            ? const Color(0xff5BA74E)
                            : Colors.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildContent(
      DetailsModel detailsModel, MerchantModel merchantModel) {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 28, bottom: 65),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
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
            style: const TextStyle(fontSize: 18, color: Color(0xff888E9A)),
          ),
          Text(
            detailsModel.name,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xff24243F)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("IDR " + detailsModel.price.toString(),
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
            padding: const EdgeInsets.only(bottom: 15),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
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
                      width: 46,
                      height: 46,
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
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xff263238)),
                    ),
                    Text(
                      merchantModel.address['city'],
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff888E9A)),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Product Description',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff263238),
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            detailsModel.description,
            style: const TextStyle(color: Color(0xff888E9A), fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Cara Merawat Product',
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff263238),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/sunny.png',
                width: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cahaya',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(
                      'Atur di dekat jendela yang terang & cerah untuk mendapatkan cahaya yang konsisten',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/water.png',
                width: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Air',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: const Text(
                      'Atur jadwal penyiraman dengan sehari 2 kali',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/chevron-left.svg'),
          ),
          const Spacer(),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is SuccesLoadCartState && state.listProducts.isNotEmpty) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFFB802),
                    borderRadius: BorderRadius.circular(8)),
                height: 20,
                width: 20,
                child:  Center(
                  child: Text(
                    '${state.listProducts.length}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext c) => const CartsPage()));
            },
            child: SvgPicture.asset('assets/icons/shopping-bag.svg'),
          ),
          const SizedBox(
            width: 27,
          )
        ],
      ),
    );
  }

  Future _showDialog(String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext c) => AlertDialog(
              title: const Text('Error'),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'oke',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
