import 'package:flutter_bloc/flutter_bloc.dart';

class CartQuantityBloc extends Cubit<int> {
  int initiallValue;

  CartQuantityBloc(this.initiallValue) : super(initiallValue);

  void plus() {
    emit(++initiallValue);
  }

  void minus() {
    emit((initiallValue == 1) ? 1 : --initiallValue);
  }
}
