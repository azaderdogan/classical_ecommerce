import 'package:ecommerce_task/model/cart_item.dart';
import 'package:ecommerce_task/model/product.dart';
import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 0)
class Cart extends HiveObject {
  @HiveField(0)
  int productsCount;
  @HiveField(1)
  double totalPrice;
  @HiveField(2)
  List<CartItem> items;
  Cart({
    required this.productsCount,
    required this.totalPrice,
    required this.items,
  });
  factory Cart.empty() => Cart(productsCount: 0, totalPrice: 0, items: []);

  @override
  String toString() =>
      'Cart(productsCount: $productsCount, totalPrice: $totalPrice, items: $items)';
}
