import 'package:flutter_bloc/flutter_bloc.dart';

class CartPriceBloc extends Cubit<int> {
  int init;

  CartPriceBloc(this.init) : super(init);

  void Plus(int value) => emit(state + value);
  void Minus(int value) {
    print('$state - $value');
    emit((state >= 0) ? state - value : 0);
  }

}
