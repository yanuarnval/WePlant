import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/order_event.dart';
import 'package:mobile_flutter/model/order_state.dart';
import 'package:mobile_flutter/network/order_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(InitialOrderLoadState()) {
    on<OrderEvent>(((event, emit)async{
      if(event is Getorder){
        emit(LoadingOrderState());
        SharedPreferences sp = await SharedPreferences.getInstance();
        final tokenUser = sp.getString('token').toString();
        final idCustomer = sp.getString('idCustomer').toString();
        try{
          final data = await OrderApi().getOrder(idCustomer, tokenUser);
        emit(SuccesLoadOrderState(data));
        }catch(e){
          emit(FailureLoadOrderState(e.toString()));
        }
      }
    }));
  }
}
