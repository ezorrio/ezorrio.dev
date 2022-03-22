import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static var primary = Colors.blueGrey;
}

class Themes {
  static const appPageTransitions = PageTransitionsTheme(builders: {
    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  });

  static ThemeData materialTheme() => ThemeData.from(
        colorScheme: ColorScheme.light(
            primary: AppColors.primary, secondary: AppColors.primary),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      ).copyWith(
        cardTheme: CardTheme(
            color: Colors.grey.shade50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        pageTransitionsTheme: appPageTransitions,
      );

  static ThemeData materialDarkTheme() => ThemeData.from(
        colorScheme: ColorScheme.dark(
            primary: AppColors.primary, secondary: AppColors.primary),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ).copyWith(
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        pageTransitionsTheme: appPageTransitions,
      );
}
