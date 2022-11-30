
part of 'widgets.dart';
class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: Card(
          child: Stack(
            children: [
              Image.network(
                'https://images.freeimages.com/images/large-previews/8b6/pumpkin-1327212.jpg',
                fit: BoxFit.fill,
                width: double.infinity,
                height: 160,
              ),
              ListTile(
                title: Text(
                  'BannerCard',
                  style: context.textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text('BannerCard ' * 4,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
