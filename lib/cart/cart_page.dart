import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/bloc/cart_bloc.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_state.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({Key? key}) : super(key: key);

  @override
  _CartsPageState createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/chevron-left.svg')),
                  Text(
                    'Cart',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is InitialCartLoadState) {
                  context.read<CartBloc>().add(GetProductsFromCart());
                }
                if (state is SuccesLoadCartState) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext c, int i) {
                        return Container(
                          height: 50,
                          color: Colors.red,
                          child: Row(
                            children: [
                              Text('dasadad')
                            ],
                          ),
                        );
                      },
                      itemCount: 100,
                    ),
                  );
                }
                return Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              }),
            ],
          )),
    ));
  }
}
