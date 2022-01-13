import 'package:equatable/equatable.dart';

abstract class MerchantEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class getMerchantById extends MerchantEvent{
    String id;

    getMerchantById(this.id);
}