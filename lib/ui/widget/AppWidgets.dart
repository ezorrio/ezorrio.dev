import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/bloc/appearance/AppearanceBloc.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class AppWidgets {
  static Widget appBackground({required BuildContext context}) => Image.asset(
        AppUtils.isSystemLight(context: context)
            ? 'drawable/background_light.png'
            : 'drawable/background_dark.png',
        filterQuality: FilterQuality.high,
        repeat: ImageRepeat.repeat,
      );

  static Widget poweredByFlutter({required BuildContext context}) => IconButton(
        icon: FlutterLogo(),
        onPressed: () async => await canLaunch(Constants.FLUTTER_URL)
            ? await launch(Constants.FLUTTER_URL)
            : throw 'Could not launch ${Constants.FLUTTER_URL}',
      );

  static Widget infoCard(
          {required BuildContext context,
          required String title,
          required Widget content}) =>
      Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
      );

  static Widget themeChooser({required BuildContext context}) => BlocBuilder(
        bloc: BlocProvider.of<AppearanceBloc>(context),
        builder: (BuildContext context, AppearanceState state) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(Icons.wb_sunny_outlined),
                disabledColor: context.primaryColor,
                onPressed: state.theme != AppTheme.LIGHT
                    ? () => BlocProvider.of<AppearanceBloc>(context)
                        .add(LightManualChose())
                    : null),
            IconButton(
                icon: Icon(Icons.nightlight_round),
                disabledColor: context.primaryColor,
                onPressed: state.theme != AppTheme.DARK
                    ? () => BlocProvider.of<AppearanceBloc>(context)
                        .add(DarkManualChose())
                    : null),
            IconButton(
                icon: Icon(Icons.brightness_auto_outlined),
                disabledColor: context.primaryColor,
                onPressed: state.theme != AppTheme.SYSTEM
                    ? () => BlocProvider.of<AppearanceBloc>(context)
                        .add(SystemChose())
                    : null),
          ],
        ),
      );
}
