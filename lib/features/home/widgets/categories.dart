part of 'widgets.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: 5,
          padding: context.horizontalPaddingLow,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.horizontalPaddingLow,
              child: Column(
                children: [
                  CircleButton(
                    child: Icon(Icons.cabin,
                        //random color here
                        color: ([...Colors.primaries]..shuffle()).first),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Category $index',
                    style: context.textTheme.button,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
