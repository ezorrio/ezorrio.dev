import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static var primary = Colors.cyan;
}

class Themes {
  static final appPageTransitions = PageTransitionsTheme(builders: {
    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  });

  static ThemeData materialTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.primary,
        cardTheme: CardTheme(
            color: Colors.grey.shade50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        scaffoldBackgroundColor: Colors.white,
        pageTransitionsTheme: appPageTransitions,
        buttonBarTheme: ButtonBarThemeData(
            buttonHeight: 40,
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      );

  static ThemeData materialDarkTheme() => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        accentColor: AppColors.primary,
        buttonColor: Colors.grey.shade900,
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        scaffoldBackgroundColor: Colors.grey.shade800,
        pageTransitionsTheme: appPageTransitions,
        buttonBarTheme: ButtonBarThemeData(
            buttonHeight: 40,
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      );
}
