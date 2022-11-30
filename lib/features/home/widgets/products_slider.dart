part of 'widgets.dart';

class ProductsSlider extends StatelessWidget {
  const ProductsSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: Padding(
        padding: context.paddingLow,
        child: ListView.separated(
          itemCount: 5,
          padding: context.horizontalPaddingLow,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //product card
            return const ProductCard();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
        ),
      ),
    );
  }
}
