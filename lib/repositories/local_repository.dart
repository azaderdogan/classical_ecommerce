import 'package:ecommerce_task/model/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../model/cart_item.dart';
import '../model/product.dart';

abstract class ILocalRepository {
  Future<Cart> getCart();
  Future<void> saveCart(Cart cart);
  Future<void> addProductToCart(Product product);
  Future<void> removeProductFromCart(Product product);
  Future<void> clearCart();
  Future<void> updateProductQuantity(Product product, int quantity);

  Future<void> decreaseQuantity(int productId);

  Future<void> onIncreaseQuantity(int productId);

  Future<void> registerEmail(String email);
}

class LocalRepository implements ILocalRepository {
  static late final Box<Cart> _cart;

  LocalRepository();
  static Future openBoxes() async {
    _cart = await _openHiveBox<Cart>("cart");
    //register adapter
  }

  static Future<Box<B>> _openHiveBox<B>(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<B>(boxName);
  }

  @override
  Future<Cart> getCart() async {
    var cart =
        _cart.get('cart') ?? Cart(items: [], productsCount: 0, totalPrice: 0);

    return Future.value(cart);
  }

  @override
  Future<void> saveCart(Cart cart) {
    return _cart.put('cart', cart);
  }

  @override
  Future<void> addProductToCart(Product product) async {
    var cart = await getCart();
    cart.items.add(CartItem(
      id: product.id!,
      product: product,
      quantity: 1,
    ));
    cart.productsCount++;
    cart.totalPrice += product.price ?? 0;
    await saveCart(cart);
  }

  @override
  Future<void> clearCart() {
    return _cart.delete('cart');
  }

  @override
  Future<void> removeProductFromCart(Product product) async {
    _cart.get('cart')!.items.removeWhere((element) => element.id == product.id);
    return await saveCart(_cart.get('cart')!);
  }

  @override
  Future<void> updateProductQuantity(Product product, int quantity) {
    var cart = _cart.get('cart')!;
    var item = cart.items.firstWhere((element) => element.id == product.id);
    item.quantity = quantity;
    cart.totalPrice = cart.items
        .map((e) => e.product.price! * e.quantity)
        .reduce((value, element) => value + element)
        .toDouble();
    return saveCart(cart);
  }

  @override
  Future<void> decreaseQuantity(int productId) async {
    var cart = _cart.get('cart')!;
    var item = cart.items.firstWhere((element) => element.id == productId);
    item.quantity--;
    cart.totalPrice -= item.product.price!;
    cart.productsCount--;
    await saveCart(cart);
  }

  @override
  Future<void> onIncreaseQuantity(int productId) async {
    var cart = _cart.get('cart')!;
    var item = cart.items.firstWhere((element) => element.id == productId);
    item.quantity++;
    cart.totalPrice += item.product.price!;
    cart.productsCount++;
    await saveCart(cart);
  }

  @override
  Future<void> registerEmail(String email) async {
    var cart = _cart.get('cart')!;
    cart.email = email;
    return await saveCart(cart);
  }
}
