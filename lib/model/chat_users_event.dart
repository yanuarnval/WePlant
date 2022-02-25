import 'package:equatable/equatable.dart';

abstract class ChatUsersEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUsersList extends ChatUsersEvent {

}

