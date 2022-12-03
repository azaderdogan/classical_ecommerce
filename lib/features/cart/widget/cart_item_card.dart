part of 'widgets.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int _quantity = 1;
  @override
  void initState() {
    super.initState();
    _quantity = widget.item.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          widget.item.product.images!.first,
          fit: BoxFit.fill,
          width: 50,
          height: 50,
        ),
        title: Text(widget.item.product.title!),
        subtitle: Text(
          widget.item.product.description!,
          maxLines: 3,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartEventDecreaseQuantity(widget.item.id));
                setState(() {
                  _quantity--;
                });
              },
              splashRadius: 20,
              splashColor: context.colorScheme.error,
              icon: const Icon(Icons.remove),
            ),
            Text(_quantity.toString()),
            IconButton(
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartEventIncreaseQuantity(widget.item.id));
                setState(() {
                  _quantity++;
                });
              },
              splashRadius: 20,
              splashColor: context.colorScheme.secondary,
              icon: Icon(Icons.add),
            ),
            Text('\$${widget.item.product.price! * _quantity} ',
                style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
