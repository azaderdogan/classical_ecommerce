part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: InkWell(
        borderRadius: context.lowBorderRadius,
        onTap: () {
          Navigator.pushNamed(context, NavigationConstants.productDetail,
              arguments: product);
        },
        child: Ink(
          width: context.dynamicWidth(0.45),
          height: context.dynamicHeight(0.3),
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: context.colorScheme.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  product.images?.first ?? 'https://via.placeholder.com/150',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 160,
                ),
              ),
              Padding(
                padding: context.paddingLow,
                child: Text(
                  product.title ?? '',
                  style: context.textTheme.headline6,
                ),
              ),
              //price with percentage
              Padding(
                padding: context.paddingLow,
                child: Text(
                  '\$${product.price}',
                  style: context.textTheme.headline6,
                ),
              ),
              Padding(
                padding: context.paddingLow,
                child: Row(
                  children: [
                    RatingBarIndicator(
                      rating: product.rating ?? 0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '(${product.rating})',
                      style: context.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
