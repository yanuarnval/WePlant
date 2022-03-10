import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/bloc/order_bloc.dart';
import 'package:mobile_flutter/model/order_event.dart';
import 'package:mobile_flutter/model/order_state.dart';
import 'package:mobile_flutter/model/product_model.dart';

import '../../model/order_model.dart';
import '../../shared/color_weplant.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'My Order',
          style:
              GoogleFonts.workSans(fontWeight: FontWeight.w700, fontSize: 28),
        ),
      ),
      body: SafeArea(
        child: BlocProvider<OrderBloc>(
          create: (_) => OrderBloc(),
          child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
            if (state is InitialOrderLoadState) {
              context.read<OrderBloc>().add(Getorder());
            }
            if (state is LoadingOrderState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsWeplant.colorPrimary,
                ),
              );
            }
            if (state is SuccesLoadOrderState) {
              return ListView.builder(
                itemCount: state.listProducts.length,
                itemBuilder: (BuildContext c, int i) {
                  return GestureDetector(
                    onTap: () {
                      _showMyDialog(state.listProducts[i]);
                    },
                    child: Container(
                        height: 166,
                        margin:
                            const EdgeInsets.only(top: 39, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.02)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(14, -6))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16)),
                              child: Image.network(
                                state.listProducts[i].imagesModel,
                                width: 137,
                                height: 166,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.listProducts[i].name
                                              .substring(0, 12) +
                                          '..',
                                      style: GoogleFonts.workSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25,
                                          color: Color(0xff24243F)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      (state.listProducts[i].description
                                                  .toString()
                                                  .length >
                                              100)
                                          ? state.listProducts[i].description
                                                  .substring(0, 100) +
                                              '..'
                                          : state.listProducts[i].description,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.3)),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'IDR',
                                                  symbol: 'Rp',
                                                  decimalDigits: 0)
                                              .format(
                                                  state.listProducts[i].price),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorsWeplant.colorPrimary,
                                              fontSize: 14),
                                        ),
                                        Text(
                                            'stock: ${state.listProducts[i].stock.toString()}')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              );
            }
            return const Center(
              child: Text('Empty Order'),
            );
          }),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(OrderModel model) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Target Location',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Address: '),
                Text(
                  '${model.address['address']}',
                ),
                const Text('City: '),
                Text(
                  '${model.address['city']}',
                ),
                const Text('Province: '),
                Text(
                  '${model.address['province']}',
                ),
                const Text('Postal Code: '),
                Text(
                  '${model.address['postal_code']}',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
