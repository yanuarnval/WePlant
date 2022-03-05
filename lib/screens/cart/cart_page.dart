import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/cart_bloc.dart';
import 'package:mobile_flutter/bloc/for%20ui/cart_price_bloc.dart';
import 'package:mobile_flutter/bloc/for%20ui/cart_quantity_bloc.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_state.dart';
import 'package:mobile_flutter/screens/cart/cart_item_component.dart';
import 'package:mobile_flutter/screens/checkout/checkout_page.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({Key? key}) : super(key: key);

  @override
  _CartsPageState createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  bool _isLoding = false;
  int _jmlh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartBloc()),
          ],
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is LoadingCartState) {
                _isLoding = true;
              }
              if (state is SuccesLoadCartState) {
                _isLoding = false;
              }
            },
            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is InitialCartLoadState) {
                context.read<CartBloc>().add(GetProductsFromCart());
              }
              if (state is SuccesLoadCartState) {
                print('sussce load');
                for (int t = 0; t < state.listProducts.length; t++) {
                  _jmlh += state.listProducts[t].price;
                }
                return BlocProvider<CartPriceBloc>(
                  create: (_) => CartPriceBloc(_jmlh),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(
                                'assets/icons/chevron-left.svg'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'My Cart',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Expanded(
                        child: (state.listProducts.isEmpty)
                            ? const Center(
                                child: Text(
                                  'Add products to your cart!',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              )
                            : (_isLoding)
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : ListView.builder(
                                    itemBuilder: (BuildContext c, int i) {
                                      return BlocProvider<CartQuantityBloc>(
                                        create: (_) => CartQuantityBloc(
                                            state.listProducts[i].quantity),
                                        child:
                                            BlocBuilder<CartQuantityBloc, int>(
                                                builder: (context, value) {
                                          return Slidable(
                                            key: Key(i.toString()),
                                            startActionPane: ActionPane(
                                              dismissible: DismissiblePane(
                                                onDismissed: () {
                                                  _jmlh = 0;
                                                  context.read<CartBloc>().add(
                                                      RemoveProductFromCart(
                                                          state.listProducts[i]
                                                              .product_id));
                                                },
                                              ),
                                              motion: const BehindMotion(),
                                              extentRatio: 0.2,
                                              children: [
                                                SlidableAction(
                                                  onPressed: (value) {},
                                                  backgroundColor:
                                                      const Color(0xFFFE4A49),
                                                  icon: Icons.delete,
                                                  foregroundColor: Colors.white,
                                                )
                                              ],
                                            ),
                                            child: CartItemComponent(
                                              listProducts:
                                                  state.listProducts[i],
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                    itemCount: state.listProducts.length,
                                  ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                'In total',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff3E4958),
                                    fontSize: 16),
                              ),
                              const Spacer(),
                              BlocBuilder<CartPriceBloc, int>(
                                  builder: (context, value) {
                                return Text(
                                  '$value',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff3E4958),
                                      fontSize: 16),
                                );
                              }),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 59, right: 59, top: 50, bottom: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext c) =>
                                              const Checkoutpage()));
                                },
                                child: const Text('Check Out')),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
