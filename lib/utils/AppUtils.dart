import 'package:ezorrio_dev/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static bool isSystemLight({required BuildContext context}) =>
      Theme.of(context).brightness == Brightness.light;

  static bool isCompact({required BuildContext context}) =>
      MediaQuery.of(context).size.width < Constants.DESKTOP_MENU_SIZE * 2.5;

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());
}
