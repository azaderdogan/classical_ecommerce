part of 'widgets.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductList(),
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Text('Total: \$100',
                    style: context.textTheme.headline6!
                        .copyWith(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.secondary,
                ),
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
