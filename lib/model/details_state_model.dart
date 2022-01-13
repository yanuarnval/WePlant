import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/details_model.dart';
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/model/product_model.dart';

abstract class DetailsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitialDetailsState extends DetailsState{

}

class LoadingDetailsState extends DetailsState{}

class SuccesLoadAllDetailsState extends DetailsState{
  final DetailsModel detailsModel;
  final MerchantModel merchantModel;
  final String message;
  SuccesLoadAllDetailsState(this.detailsModel,this.message,this.merchantModel);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{listProfiles: $detailsModel,$merchantModel message: $message}';
  }
}

class FailureLoadDetailsState extends DetailsState{
  final String errorMessage;

  FailureLoadDetailsState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}