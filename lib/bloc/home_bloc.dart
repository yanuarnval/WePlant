import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/model/product_state_model.dart';
import 'package:mobile_flutter/network/home_api.dart';

class HomeBloc extends Bloc<ProductEvent, ProductState> {
  HomeBloc() : super(InitialProductState()) {
    on<ProductEvent>(
      (event, emit) async {
        emit(LoadingProductState());
        final response = await HomeApi.getAllProduct();
        if (response.isEmpty) {
          emit(FailureLoadProductState("error load product $response"));
        } else {
          emit(SuccesLoadAllProductState(response, "succes load all product"));
        }
      },
    );
  }
}
