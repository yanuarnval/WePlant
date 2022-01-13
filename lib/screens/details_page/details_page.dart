import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/details_bloc.dart';
import 'package:mobile_flutter/model/details_event.dart';
import 'package:mobile_flutter/model/details_model.dart';
import 'package:mobile_flutter/model/details_state_model.dart';
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/screens/loadingScreens/details_page_loading.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class DetailsPage extends StatefulWidget {
  String urlProduct;

  DetailsPage({Key? key, required this.urlProduct}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int jmlhBarang = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider<DetailsBloc>(
            create: (_) => DetailsBloc(widget.urlProduct),
            child:
            BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
              if (state is InitialDetailsState) {
                print('initialized');
                context.read<DetailsBloc>().add(getProductById());
              }
              if (state is SuccesLoadAllDetailsState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Stack(children: [
                          _buildImageSlider(context, state.detailsModel),
                          _buildHeader(context)
                        ]),
                        _buildContent(state.detailsModel, state.merchantModel),
                      ],
                    ),

                );
              } else {
                return const DetailsPageLoading();
              }
            }),
          )),
    );
  }

  SizedBox _buildImageSlider(BuildContext context, DetailsModel detailsModel) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) =>
              Image.network(
                detailsModel.main_image['url'],
                fit: BoxFit.contain,
              )),
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
            style: WeplantTheme.textTheme.headline3,
          ),
          Text(
            detailsModel.name,
            style: WeplantTheme.textTheme.headline2,
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
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border:
                  Border.all(width: 2, color: ColorsWeplant.colorSearchBox),
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
                          fontWeight: FontWeight.w600, fontSize: 16),
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
                      style: WeplantTheme.textTheme.subtitle1,
                    ),
                    Text(
                      merchantModel.address['city'],
                      style: WeplantTheme.textTheme.subtitle1,
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        'assets/icons/message-circle.svg',
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('Description',style: WeplantTheme.textTheme.headline3,),
          ),

          Text(detailsModel.description)
        ],
      ),
    );
  }

  Positioned _buildHeader(BuildContext context) {
    return Positioned(
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
        ));
  }
}
