import 'package:flutter/material.dart';
import 'package:students_chapter_cse/components/Navbar/navbar.dart';
import 'package:students_chapter_cse/themes/theme_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      bottomNavigationBar: Container(child: Navbar()),
    );
  }
}
