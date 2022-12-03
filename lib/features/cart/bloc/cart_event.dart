part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartEventRemoveFromCart extends CartEvent {
  final int productId;

  CartEventRemoveFromCart(this.productId);
}

class CartEventAddToCart extends CartEvent {
  final Product product;

  CartEventAddToCart(this.product);
}

class CartEventLoadCart extends CartEvent {}

class CartEventIncreaseQuantity extends CartEvent {
  final int productId;

  CartEventIncreaseQuantity(this.productId);
}

class CartEventDecreaseQuantity extends CartEvent {
  final int productId;

  CartEventDecreaseQuantity(this.productId);
}

class CartEventCheckout extends CartEvent {}
  
class CartEventRegisterEmail extends CartEvent {
  final String email;

  CartEventRegisterEmail(this.email);
}
