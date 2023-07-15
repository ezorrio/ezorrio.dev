import 'package:flutter/widgets.dart';

class ConditionalPadding extends StatelessWidget {
  final Widget child;
  final bool needPadding;

  const ConditionalPadding({super.key, required this.child, required this.needPadding});

  @override
  Widget build(BuildContext context) => Padding(
        padding: needPadding ? const EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.zero,
        child: child,
      );
}
