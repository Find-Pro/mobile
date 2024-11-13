import 'package:findpro/common/theme/custom_color_scheme.dart';
import 'package:findpro/common/theme/custom_text_style.dart';
import 'package:findpro/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
class LightThemeManager implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        indicatorColor: Colors.black,
        canvasColor: const Color(0xff4b5a60ff),
        primaryColor: Colors.teal,
        dividerColor: Colors.grey,
        cardColor: Colors.blueAccent.shade200,
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        textTheme: TextTheme(
          bodyLarge:
              CustomTextStyle.headline38.copyWith(color: Colors.black),
          bodyMedium:
              CustomTextStyle.headline34.copyWith(color: Colors.black),
          bodySmall:
              CustomTextStyle.headline28.copyWith(color: Colors.black),
          displayLarge:
              CustomTextStyle.headline28.copyWith(color: Colors.black),
          displayMedium:
              CustomTextStyle.headline26.copyWith(color: Colors.black),
          displaySmall:
              CustomTextStyle.headline24.copyWith(color: Colors.black),
          headlineLarge:
              CustomTextStyle.headline20.copyWith(color: Colors.black),
          headlineMedium:
              CustomTextStyle.headline18.copyWith(color: Colors.black),
          headlineSmall:
              CustomTextStyle.headline16.copyWith(color: Colors.black),
          labelLarge:
              CustomTextStyle.headline14.copyWith(color: Colors.black),
          labelMedium:
              CustomTextStyle.headline12.copyWith(color: Colors.black),
          labelSmall:
              CustomTextStyle.headline10.copyWith(color: Colors.black),
        ),
      );
}
