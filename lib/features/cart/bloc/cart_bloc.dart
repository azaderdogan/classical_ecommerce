import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/repositories/local_repository.dart';
import 'package:meta/meta.dart';

import '../../../model/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ILocalRepository _localRepository;
  CartBloc(this._localRepository) : super(CartInitial()) {
    on<CartEventAddToCart>(_onAddToCart);
    on<CartEventRemoveFromCart>(_onRemoveFromCart);
    on<CartEventLoadCart>(_onLoadCart);
  }

  FutureOr<void> _onAddToCart(
      CartEventAddToCart event, Emitter<CartState> emit) {}

  FutureOr<void> _onRemoveFromCart(
      CartEventRemoveFromCart event, Emitter<CartState> emit) {}

  Future<FutureOr<void>> _onLoadCart(
      CartEventLoadCart event, Emitter<CartState> emit) async {
    // fetch cart from local storage
    try {
      emit(CartLoading());
      final cart = await _localRepository.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError());
    }
  }
}
