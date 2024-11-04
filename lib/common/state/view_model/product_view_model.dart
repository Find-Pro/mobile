import 'package:findpro/common/state/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

/// ProductViewModel, state'i yöneten StateNotifier sınıfı.
class ProductViewModel extends StateNotifier<ProductState> {
  ProductViewModel() : super(const ProductState());

  /// Tema modunu değiştirir.
  void changeThemeMode() {
    state = state.copyWith(
      themeMode: state.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}

/// Riverpod provider tanımı
final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductState>(
  (ref) => ProductViewModel(),
);
