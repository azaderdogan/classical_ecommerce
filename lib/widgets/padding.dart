
part of 'widgets.dart';
class PaddingNormal extends StatelessWidget {
  const PaddingNormal({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: child,
    );
  }
}

class PaddingMedium extends StatelessWidget {
  const PaddingMedium({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: child,
    );
  }
}

class PaddingLow extends StatelessWidget {
  const PaddingLow({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: child,
    );
  }
}

class PaddingHigh extends StatelessWidget {
  const PaddingHigh({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHigh,
      child: child,
    );
  }
}
