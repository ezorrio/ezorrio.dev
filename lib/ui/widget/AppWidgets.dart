import 'package:ezorrio_dev/Extensions.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  static Widget infoCard(
          {required BuildContext context,
          required String title,
          required Widget content}) =>
      SizedBox(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: context.textStyleTitle.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                content,
              ],
            ),
          ),
        ),
      );
}
