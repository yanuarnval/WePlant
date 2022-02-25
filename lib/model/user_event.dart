import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class getUserFromFirestore extends UserEvent {}

class getUserByEmailFirestore extends UserEvent {
  String email;

  getUserByEmailFirestore(this.email);
}
