import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle unselectedCurrencyName() => const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle selectedCurrencyName() => const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle unselectedCurrencyInitials() => TextStyle(fontSize: 11, color: Colors.grey[700]);
  static TextStyle selectedCurrencyInitials() => const TextStyle(fontSize: 11, color: Colors.white);
  static TextStyle favouriteButton() => const TextStyle(fontSize: 14, color: Color(0xff20253D), fontWeight: FontWeight.w700);
}
