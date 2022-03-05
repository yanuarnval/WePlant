import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/cart_bloc.dart';
import 'package:mobile_flutter/bloc/for%20ui/cart_price_bloc.dart';
import 'package:mobile_flutter/bloc/for%20ui/cart_quantity_bloc.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_model.dart';

class CartItemComponent extends StatelessWidget {
  final CartModel listProducts;

  const CartItemComponent({Key? key, required this.listProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffD5DDE0), width: 1)),
      child: Row(
        children: [
          Image.network(
            listProducts.img,
            width: 69,
            height: 102,
            fit: BoxFit.fill,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listProducts.name,
                    style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: const Color(0xff24243F)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ${listProducts.price.toString()}',
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: const Color(0xff24243F)),
                      ),
                      BlocBuilder<CartQuantityBloc, int>(
                          builder: (context, value) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<CartQuantityBloc>().minus();
                                
                                if (value != 1) {
                                  context
                                      .read<CartPriceBloc>()
                                      .Minus((listProducts.price * value));
                                }
                              },
                              child: Container(
                                height: 35,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(13)),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: BlocBuilder<CartQuantityBloc, int>(
                                  builder: (context, value) {
                                return Text('$value');
                              }),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.read<CartQuantityBloc>().plus();
                                context
                                    .read<CartPriceBloc>()
                                    .Plus((listProducts.price * ++value));
                              },
                              child: Container(
                                height: 35,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(13)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}