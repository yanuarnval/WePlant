import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/product_data.dart';
import 'package:mobile_flutter/model/product_model.dart';
import 'package:mobile_flutter/network/home_api.dart';

class HomeBloc extends Cubit<ProductState> {
  HomeBloc() : super(InitialProductState());

  void getAllProduct() async {
    emit(LoadingProductState());
    final result = await HomeApi.getAllProduct();
    if (result.isEmpty) {
      emit(FailureLoadProductState('${result}'));
    } else {
      emit(SuccesLoadAllProductState(result, 'Succes load all product'));
    }
  }
}
