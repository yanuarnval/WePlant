import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class MessageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialMessageLoadState extends MessageState {}

class SuccesLoadMessageState extends MessageState {
  List msg;
  String uid;
  String uidChatrooms;

  SuccesLoadMessageState(this.msg, this.uid,this.uidChatrooms);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{message: $msg,}';
  }
}

class EmpetyMsgState extends MessageState {

}

class FailureLoadMessageState extends MessageState {
  final String errorMessage;

  FailureLoadMessageState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
