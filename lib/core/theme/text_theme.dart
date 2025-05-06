import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle? get h1 =>
      GoogleFonts.playfair(fontSize: 27, fontWeight: FontWeight.bold);

  static TextStyle? get h2 =>
      TextStyle(fontSize: 19, fontWeight: FontWeight.bold);

  static TextStyle? get h3 => h2?.copyWith(fontSize: 15);

  static TextStyle? get h4 => h3?.copyWith(fontSize: 11);

  static TextStyle? get bodyText => const TextStyle(fontSize: 14);

  static TextStyle? get bodyTextSmall => bodyText!.copyWith(fontSize: 11);

  static TextStyle? get bodyTextGrey =>
      bodyTextSmall?.copyWith(color: Colors.grey);
}
