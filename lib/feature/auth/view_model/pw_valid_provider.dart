import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final passwordValidProvider = Provider<ValueNotifier<bool>>((ref) {
  return ValueNotifier<bool>(true);
});
