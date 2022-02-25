import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class ChatUsersState extends Equatable {
@override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialLoadChatUsersState extends ChatUsersState{

}

class EmpetyChatState extends ChatUsersState{

}

class SuccesLoadChatUsersState extends ChatUsersState {
  final List chatrooms;

  SuccesLoadChatUsersState(this.chatrooms);

}

class FailureLoadChatUsersState extends ChatUsersState {
  final String errorMessage;

  FailureLoadChatUsersState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
