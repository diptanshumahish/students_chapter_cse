import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeMain {
  static final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 201, 159, 75)),
      useMaterial3: true,
      textTheme: GoogleFonts.karlaTextTheme().apply());
}
