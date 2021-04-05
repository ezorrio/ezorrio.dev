import 'package:ezorrio_dev/Constants.dart';
import 'package:flutter/cupertino.dart';

class AppUtils {
  static bool get isSystemLight =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .platformBrightness ==
      Brightness.light;

  static bool isCompact({required BuildContext context}) =>
      MediaQuery.of(context).size.width < Constants.DESKTOP_MENU_SIZE * 2.5;

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());
}
