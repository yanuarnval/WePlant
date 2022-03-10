import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/model/transaksi_model.dart';

abstract class TransaksiState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialTransaksiState extends TransaksiState{

}

class LoadingTransaksiState extends TransaksiState{

}

class SuccesTransaksiState extends TransaksiState{
  List<TransaksiModel> data;
  SuccesTransaksiState(this.data);

}

class FailureTransaksiState extends TransaksiState{
  final String errorMessage;

  FailureTransaksiState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}