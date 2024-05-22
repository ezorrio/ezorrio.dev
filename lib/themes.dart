import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static var primary = Colors.black87;
  static var primaryDark = Colors.white;
}

class Themes {
  static const appPageTransitions = PageTransitionsTheme(builders: {
    TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  });

  static ThemeData materialTheme() => ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          secondary: AppColors.primary,
          primary: AppColors.primary,
        ),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      ).copyWith(
        cardTheme: CardTheme(
          // color: Colors.grey.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 0,
        ),
        pageTransitionsTheme: appPageTransitions,
      );

  static ThemeData materialDarkTheme() => ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDark,
          primary: AppColors.primaryDark,
          secondary: AppColors.primaryDark,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ).copyWith(
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        pageTransitionsTheme: appPageTransitions,
      );
}
