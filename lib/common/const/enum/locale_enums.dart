import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  tr(Locale('tr', 'TR')),
  de(Locale('de', 'DE')),
  cn(Locale('cn', 'CN')),
  fr(Locale('fr', 'FR')),
  ind(Locale('ind', 'IND')),
  jp(Locale('jp', 'JP')),
  kr(Locale('kr', 'KR')),
  ru(Locale('ru', 'RU')),
  en(Locale('en', 'US'));

  const Locales(this.locale);

  /// Locale value
  final Locale locale;
}
