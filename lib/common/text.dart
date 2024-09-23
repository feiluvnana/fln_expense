import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const display1 = TextStyle(
    fontSize: 52, height: 1, fontWeight: FontWeight.w600, letterSpacing: 0);
const display2 = TextStyle(
    fontSize: 36, height: 1, fontWeight: FontWeight.w600, letterSpacing: 0);

const title1 = TextStyle(
    fontSize: 16, height: 1, fontWeight: FontWeight.w600, letterSpacing: 0);
const title2 = TextStyle(
    fontSize: 14, height: 1, fontWeight: FontWeight.w600, letterSpacing: 0);
const title3 = TextStyle(
    fontSize: 12, height: 1, fontWeight: FontWeight.w600, letterSpacing: 0);

const regular = TextStyle(fontSize: 14, height: 1, letterSpacing: 0);
const small = TextStyle(fontSize: 12, height: 1, letterSpacing: 0);
const tiny = TextStyle(fontSize: 10, height: 1, letterSpacing: 0);

class CurrencyTextFormatter extends TextInputFormatter {
  final NumberFormat _currencyFormat = NumberFormat("#,##0₫");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length <= 1) {
      return oldValue.copyWith(text: "0₫");
    }

    if (newValue.text.length >= 17) {
      return oldValue;
    }

    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final formattedValue = _currencyFormat.format(int.parse(newText));

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length - 1),
    );
  }
}
