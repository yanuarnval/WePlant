import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/transaksi_event.dart';
import 'package:mobile_flutter/model/transaksi_state.dart';
import 'package:mobile_flutter/network/transaksi_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc() : super(InitialTransaksiState()) {
    on<TransaksiEvent>((event, emit) async {
      if (event is GetTransaction) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        final tokenUser = sp.getString('token').toString();
        final idCustomer = sp.getString('idCustomer').toString();
        try {
          final data = await TransaksiApi().getTransaksi(idCustomer, tokenUser);
          print(data.length);
          emit(SuccesTransaksiState(data));
        } catch (e) {
          print(e);
          emit(FailureTransaksiState(e.toString()));
        }
      }
    });
  }
}
