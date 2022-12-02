
part of 'widgets.dart';
class CountBanner extends StatelessWidget {
  const CountBanner({
    Key? key,
    required this.child,
    required this.count,
  }) : super(key: key);
  final Widget child;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      child,
      Positioned(
        top: -5,
        right: -10,
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              count,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }
}

class MyWidget extends BottomNavigationBarItem {
  MyWidget({required super.icon});
}
