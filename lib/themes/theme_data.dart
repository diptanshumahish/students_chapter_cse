import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeMain {
  static final theme = ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 237, 122)),
      useMaterial3: true,
      textTheme: GoogleFonts.ralewayTextTheme().apply());
}
