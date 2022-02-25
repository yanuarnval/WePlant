import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/product_event.dart';
import 'package:mobile_flutter/model/product_model.dart';
import 'package:mobile_flutter/model/product_state_model.dart';
import 'package:mobile_flutter/network/home_api.dart';

class HomeBloc extends Bloc<ProductEvent, ProductState> {
  HomeBloc() : super(InitialProductState()) {
    on<ProductEvent>(
      (event, emit) async {
        emit(LoadingProductState());
          List<ProductModel> response = await HomeApi.getAllProduct();
          List<ProductModel> reversedList= List.from(response.reversed);
          if (response.isEmpty) {
            emit(FailureLoadProductState("error load product $response"));
          } else {
            print(response[0].name);
            emit(
                SuccesLoadAllProductState(reversedList, "succes load all product"));
          }
      },
    );
  }
}
