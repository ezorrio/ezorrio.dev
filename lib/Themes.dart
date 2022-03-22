import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static var primary = Colors.cyan;
}

class Themes {
  static const appPageTransitions = PageTransitionsTheme(builders: {
    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  });

  static ThemeData materialTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        cardTheme: CardTheme(
            color: Colors.grey.shade50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        scaffoldBackgroundColor: Colors.white,
        pageTransitionsTheme: appPageTransitions,
        fontFamily: GoogleFonts.montserrat().fontFamily, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
      );

  static ThemeData materialDarkTheme() => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        scaffoldBackgroundColor: Colors.grey.shade800,
        pageTransitionsTheme: appPageTransitions,
        fontFamily: GoogleFonts.montserrat().fontFamily, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
      );
}
