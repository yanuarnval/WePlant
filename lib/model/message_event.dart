import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class MessageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostMessageToFirebase extends MessageEvent {
  String msg;
  String merchantEmail;

  PostMessageToFirebase(this.msg, this.merchantEmail);

}

class GetMessageFromFirebase extends MessageEvent {
  String emailMerchant;

  GetMessageFromFirebase(this.emailMerchant);
}
