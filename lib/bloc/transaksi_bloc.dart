import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/transaksi_event.dart';
import 'package:mobile_flutter/model/transaksi_state.dart';
import 'package:mobile_flutter/network/transaksi_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc() :super(InitialTransaksiState()) {
    on<TransaksiEvent>((event, emit) async {

    });
  }
}