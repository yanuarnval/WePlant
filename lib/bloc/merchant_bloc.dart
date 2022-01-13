
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/merchant_event.dart';
import 'package:mobile_flutter/model/merchant_state.dart';
import 'package:mobile_flutter/network/merchant_api.dart';

class MerchantBloc extends Bloc<MerchantEvent,MerchantState>{
  MerchantBloc() : super(InitialMerchantState()) {
    on<MerchantEvent>((event, emit) async {
      emit(LoadingMerchantState());
      if (event is getMerchantById) {
        final result = await MerchantApi.getMerchantById(event.id);
        if (result.name.isEmpty) {
          emit(FailureLoadMerchantState('$result'));
        } else {
          emit(SuccesLoadMerchantState(result, 'Succes get product'));
        }
      }
    });
  }

}