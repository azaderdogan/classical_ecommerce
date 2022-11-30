part of 'widgets.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return PaddingNormal(
      child: Text(
        title,
        style: context.textTheme.headline4,
      ),
    );
  }
}
