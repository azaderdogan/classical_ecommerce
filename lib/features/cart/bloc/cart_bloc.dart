import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEventAddToCart>(_onAddToCart);
  }

  FutureOr<void> _onAddToCart(
      CartEventAddToCart event, Emitter<CartState> emit) {
        
      }
}
