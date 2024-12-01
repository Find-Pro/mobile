import 'package:findpro/common/theme/custom_color_scheme.dart';
import 'package:findpro/common/theme/custom_text_style.dart';
import 'package:findpro/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
class DarkThemeManager implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        indicatorColor: Colors.white,
        canvasColor: const Color(0XFF4b5a60ff),
        primaryColor: Colors.brown,
        primaryColorDark: Colors.blue.shade200,
        dividerColor: Colors.white70,
        cardColor: Colors.blueAccent.shade200,
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        textTheme: TextTheme(
          bodyLarge:
              CustomTextStyle.headline38.copyWith(color: Colors.white),
          bodyMedium:
              CustomTextStyle.headline34.copyWith(color: Colors.white),
          bodySmall:
              CustomTextStyle.headline28.copyWith(color: Colors.white),
          displayLarge:
              CustomTextStyle.headline28.copyWith(color: Colors.white),
          displayMedium:
              CustomTextStyle.headline26.copyWith(color: Colors.white),
          displaySmall:
              CustomTextStyle.headline24.copyWith(color: Colors.white),
          headlineLarge:
              CustomTextStyle.headline20.copyWith(color: Colors.white),
          headlineMedium:
              CustomTextStyle.headline18.copyWith(color: Colors.white),
          headlineSmall:
              CustomTextStyle.headline16.copyWith(color: Colors.white),
          labelLarge:
              CustomTextStyle.headline14.copyWith(color: Colors.white),
          labelMedium:
              CustomTextStyle.headline12.copyWith(color: Colors.white),
          labelSmall:
              CustomTextStyle.headline10.copyWith(color: Colors.white),
        ),
      );
}
