import 'package:mobile_flutter/model/product_model.dart';

abstract class ProductState{}

class InitialProductState extends ProductState{

}

class LoadingProductState extends ProductState{}

class SuccesLoadAllProductState extends ProductState{
  final List<ProductModel> listProduct;
  final String message;
  SuccesLoadAllProductState(this.listProduct,this.message);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{listProfiles: $listProduct, message: $message}';
  }
}

class FailureLoadProductState extends ProductState{
  final String errorMessage;

  FailureLoadProductState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}