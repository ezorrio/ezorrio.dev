import 'package:flutter/material.dart';

class Cookies extends StatelessWidget {
  final bool isDark;

  const Cookies({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        isDark
            ? 'drawable/background_light.png'
            : 'drawable/background_dark.png',
        filterQuality: FilterQuality.high,
        repeat: ImageRepeat.repeat,
      );
}
