import 'package:equatable/equatable.dart';

abstract class TransaksiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostTransaksi extends TransaksiEvent {
  final String address;
  final String city;
  final String province;
  final String postalCode;

  PostTransaksi(this.address, this.city, this.province, this.postalCode);
}

class GetTransaction extends TransaksiEvent{

}

