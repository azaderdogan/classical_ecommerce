part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.4),
      height: context.dynamicHeight(0.3),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: context.highBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: context.lowBorderRadius,
              ),
              child: Image.network(
                'https://picsum.photos/200/${Random().nextInt(10) * 100}',
                fit: BoxFit.fill,
                width: double.infinity,
                height: 160,
              ),
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: Text(
              'Product Name',
              style: context.textTheme.headline6,
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: Text(
              '\$ 100',
              style: context.textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
