import 'package:ezorrio_dev/bloc/appearance/appearance_cubit.dart';
import 'package:ezorrio_dev/bloc/appearance/appearance_state.dart';
import 'package:ezorrio_dev/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChooser extends StatelessWidget {
  const ThemeChooser({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder(
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
}
