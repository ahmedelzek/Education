import 'package:flutter/material.dart';

LinearGradient customLinearGradient() {
  return LinearGradient(
    colors: [
      Color(0xFF41D1FF),
      Color(0xFF0B3C4E),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}