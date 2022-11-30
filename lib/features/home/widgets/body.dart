part of 'widgets.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleText(title: 'Categories'),
        Categories(),
        TitleText(title: 'Latest'),
        BannerCard(),
        ProductsSlider(),
      ],
    );
  }
}
