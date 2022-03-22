import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class Cookies extends StatelessWidget {
  const Cookies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        AppUtils.isSystemLight(context: context)
            ? 'drawable/background_light.png'
            : 'drawable/background_dark.png',
        filterQuality: FilterQuality.high,
        repeat: ImageRepeat.repeat,
      );
}
