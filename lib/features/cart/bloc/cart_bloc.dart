import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/model/cart_item.dart';
import 'package:ecommerce_task/model/product.dart';
import 'package:ecommerce_task/repositories/local_repository.dart';
import 'package:ecommerce_task/utils.dart';
import 'package:meta/meta.dart';

import '../../../model/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ILocalRepository _localRepository;
  Cart cart = Cart.empty();
  CartBloc(this._localRepository) : super(CartInitial()) {
    on<CartEventAddToCart>(_onAddToCart);
    on<CartEventRemoveFromCart>(_onRemoveFromCart);
    on<CartEventLoadCart>(_onLoadCart);
    on<CartEventIncreaseQuantity>(_onIncreaseQuantity);
    on<CartEventDecreaseQuantity>(_onDecreaseQuantity);
    on<CartEventCheckout>(_onCheckout);
    on<CartEventRegisterEmail>(_onRegisterEmail);
  }

  Future<FutureOr<void>> _onAddToCart(
      CartEventAddToCart event, Emitter<CartState> emit) async {
    try {
      _localRepository.addProductToCart(event.product);
      emit(CartLoaded(await _localRepository.getCart()));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  FutureOr<void> _onRemoveFromCart(
      CartEventRemoveFromCart event, Emitter<CartState> emit) {}

  Future<FutureOr<void>> _onLoadCart(
      CartEventLoadCart event, Emitter<CartState> emit) async {
    // fetch cart from local storage
    try {
      emit(CartLoading());
      final cart = await _localRepository.getCart();
      this.cart = cart;
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError());
    }
  }

  Future<FutureOr<void>> _onDecreaseQuantity(
      CartEventDecreaseQuantity event, Emitter<CartState> emit) async {
    try {
      await _localRepository.decreaseQuantity(event.productId);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<FutureOr<void>> _onIncreaseQuantity(
      CartEventIncreaseQuantity event, Emitter<CartState> emit) async {
    try {
      await _localRepository.onIncreaseQuantity(event.productId);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<FutureOr<void>> _onCheckout(
      CartEventCheckout event, Emitter<CartState> emit) async {
    try {
      sendMail('azadderdogan@gmail.com', 'Sepetinizdeki Ürünler',
          productsToHtmlContent(cart.items));
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  //read index.html from assets
  String productsToHtmlContent(List<CartItem> cartItems) {
    String content = '';
    for (var element in cartItems) {
      content +=
          '<tr><td>${element.product.title}</td><td>${element.quantity}</td><td>${element.product.price}</td></tr>';
    }

    return content;
  }

  Future<FutureOr<void>> _onRegisterEmail(
      CartEventRegisterEmail event, Emitter<CartState> emit) async {
    try {
      await _localRepository.registerEmail(event.email);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
