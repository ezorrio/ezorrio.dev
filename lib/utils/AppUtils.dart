import 'package:ezorrio_dev/Constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static bool isSystemLight({required BuildContext context}) =>
      Theme.of(context).colorScheme.brightness == Brightness.light;

  static bool isCompact({required BuildContext context}) =>
      MediaQuery.of(context).size.width < Constants.desktopMenuSize * 2.5;

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  static String formatTime(DateTime? time) => time != null
      ? DateTime.now().difference(time) < const Duration(days: 1)
          ? 'now'
          : DateFormat('yyyy/MM').format(time)
      : '?';
}
