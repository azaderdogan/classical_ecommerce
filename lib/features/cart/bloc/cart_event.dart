part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartEventRemoveFromCart extends CartEvent {
  final int productId;

  CartEventRemoveFromCart(this.productId);
}

class CartEventAddToCart extends CartEvent {
  final int productId;

  CartEventAddToCart(this.productId);
}

class CartEventLoadCart extends CartEvent {}
