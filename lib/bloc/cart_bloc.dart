import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/cart_event.dart';
import 'package:mobile_flutter/model/cart_state.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/network/cart_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialCartLoadState()) {
    on<CartEvent>(
      (event, emit) async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        final tokenUser = sp.getString('token').toString();
        final idCustomer = sp.getString('idCustomer').toString();
        if (event is AddProductToCart) {
          emit(LoadingCartState());
          try {
            final listProducts = await CartApi.postProductToCart(
                event.idProduct, tokenUser, idCustomer);
            emit(SuccesLoadPostCartState(listProducts));
          } on Exception catch (e) {
            emit(FailureLoadCartState('$e'));
          }
        }
        if (event is GetProductsFromCart) {
          emit(LoadingCartState());
          try {
            final response =
                await CartApi.getProductsfromCart(idCustomer, tokenUser);
            emit(SuccesLoadCartState(response));
          } catch (e) {
            emit(FailureLoadCartState('$e'));
          }
        }
        if (event is RemoveProductFromCart) {
          emit(LoadingCartState());
          try {
            await CartApi()
                .removeProductFromCart(idCustomer, event.productId, tokenUser);
            print('succesdelete');
            emit(InitialCartLoadState());
          } catch (e) {
            print('$e');
            emit(FailureLoadCartState(e.toString()));
          }
        }

      },
    );
  }
}
