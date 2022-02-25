import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_state.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/network/cart_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialCartLoadState()) {
    on<CartEvent>((event, emit) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      final tokenUser = sp.getString('token').toString();
      final idCustomer = sp.getString('idCustomer').toString();
      if (event is AddProductToCart) {
        emit(LoadingCartState());
        final response = await CartApi.postProductToCart(
            event.idProduct, tokenUser, idCustomer);
        print(response.isEmpty);
        if (response.isEmpty) {
          emit(FailureLoadCartState('errorMessage'));
        } else {
          emit(SuccesLoadCartState());
        }
      }
      if (event is GetProductsFromCart) {
        emit(LoadingCartState());
        final response =
            await CartApi.getProductsfromCart(idCustomer, tokenUser);
        print(response.isEmpty);
        if (response.isEmpty) {
          emit(FailureLoadCartState('errorMessage'));
        } else {
          emit(SuccesLoadCartState());
        }
      }
    });
  }
}
