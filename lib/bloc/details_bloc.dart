import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/details_event.dart';
import 'package:mobile_flutter/model/details_state_model.dart';
import 'package:mobile_flutter/model/merchant_event.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/network/details_api.dart';
import 'package:mobile_flutter/network/merchant_api.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(String id) : super(InitialDetailsState()) {
    on<DetailsEvent>((event, emit) async {
      emit(LoadingDetailsState());
      if (event is getProductById) {
        print(id);
        final result = await DetailsApi.getProductById(id);
        if (result.name.isEmpty) {
          emit(FailureLoadDetailsState('$result'));
        } else {
          final resultMerchant =
              await MerchantApi.getMerchantById(result.merchant_id);
          if (resultMerchant.name.isNotEmpty) {
            emit(SuccesLoadAllDetailsState(
                result, 'Succes get product', resultMerchant));
          } else {
            emit(FailureLoadDetailsState('$resultMerchant'));
          }
        }
      }
    });
  }
}
