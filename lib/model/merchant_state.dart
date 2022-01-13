import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class MerchantState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialMerchantState extends MerchantState{

}

class LoadingMerchantState extends MerchantState{}

class SuccesLoadMerchantState extends MerchantState{
  final MerchantModel merchantModel;
  final String message;
  SuccesLoadMerchantState(this.merchantModel,this.message);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{listProfiles: $merchantModel, message: $message}';
  }
}

class FailureLoadMerchantState extends MerchantState{
  final String errorMessage;

  FailureLoadMerchantState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}