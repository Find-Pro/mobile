import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  zh(Locale('zh', 'CN')),
  de(Locale('de', 'DE')),
  en(Locale('en', 'US')),
  fr(Locale('fr', 'FR')),
  id(Locale('id', 'ID')),
  ja(Locale('ja', 'JP')),
  ko(Locale('ko', 'KR')),
  ru(Locale('ru', 'RU')),
  tr(Locale('tr', 'TR'));

  const Locales(this.locale);

  final Locale locale;
}
