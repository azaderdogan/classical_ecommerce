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
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item.product.images!.first,
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
              title: Text(item.product.title!),
              subtitle: Text(item.product.description!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    splashColor: context.colorScheme.error,
                    icon: Icon(Icons.remove),
                  ),
                  Text('1'),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    splashColor: context.colorScheme.secondary,
                    icon: Icon(Icons.add),
                  ),
                  Text('\$ 10', style: context.textTheme.headline6),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
