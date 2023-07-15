import 'package:ezorrio_dev/bloc/appearance/appearance_cubit.dart';
import 'package:ezorrio_dev/bloc/appearance/appearance_state.dart';
import 'package:ezorrio_dev/constants.dart';
import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppWidgets {
  static Widget poweredByFlutter({required BuildContext context}) => IconButton(
        icon: const FlutterLogo(),
        onPressed: () async => await canLaunchUrlString(Constants.flutterUrl)
            ? await launchUrlString(Constants.flutterUrl)
            : throw 'Could not launch ${Constants.flutterUrl}',
      );

  static Widget infoCard({
    required BuildContext context,
    required String title,
    required Widget content,
    String? link,
  }) =>
      Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title,
                        style:
                            context.textStyleBody1.copyWith(color: context.primaryColor, fontWeight: FontWeight.bold)),
                  ),
                  if (link != null)
                    InkWell(
                      onTap: () async =>
                          await canLaunchUrlString(link) ? await launchUrlString(link) : throw 'Could not launch $link',
                      child: const Icon(
                        Icons.link,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      );

  static Widget themeChooser({required BuildContext context}) => BlocBuilder(
        bloc: BlocProvider.of<AppearanceCubit>(context),
        builder: (BuildContext context, AppearanceState state) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.wb_sunny_outlined),
                disabledColor: context.primaryColor,
                onPressed: state.appTheme != AppTheme.light
                    ? () => BlocProvider.of<AppearanceCubit>(context).lightManualChose()
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.nightlight_round),
                disabledColor: context.primaryColor,
                onPressed: state.appTheme != AppTheme.dark
                    ? () => BlocProvider.of<AppearanceCubit>(context).darkManualChose()
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.brightness_auto_outlined),
                disabledColor: context.primaryColor,
                onPressed: state.appTheme != AppTheme.system
                    ? () => BlocProvider.of<AppearanceCubit>(context).systemChose()
                    : null,
              ),
            ],
          ),
        ),
      );

  static Widget conditionalPadding({
    required BuildContext context,
    required Widget child,
  }) =>
      Padding(
        padding: AppUtils.isCompact(context: context) ? const EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.zero,
        child: child,
      );
}
