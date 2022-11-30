part of 'widgets.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                'https://images.freeimages.com/images/large-previews/8b6/pumpkin-1327212.jpg',
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
              title: Text('Title'),
              subtitle: Text('Subtitle'),
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
