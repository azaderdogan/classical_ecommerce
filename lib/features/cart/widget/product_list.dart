part of 'widgets.dart';

class ProductList extends StatelessWidget {
  ProductList({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return CartItemCard(item: item);
          },
        ),
      ),
    );
  }
}