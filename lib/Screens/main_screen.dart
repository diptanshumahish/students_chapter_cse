import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students_chapter_cse/components/MainBody/daily.dart';
import 'package:students_chapter_cse/components/MainBody/events.dart';
import 'package:students_chapter_cse/components/MainBody/home.dart';
import 'package:students_chapter_cse/components/MainBody/profile.dart';
import 'package:students_chapter_cse/components/Navbar/navbar.dart';
import 'package:students_chapter_cse/providers/tab.provider.dart';
import 'package:students_chapter_cse/themes/theme_colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final mainBody = [
    const Home(),
    const Daily(),
    const Events(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final index = ref.watch(tabProvider);
        return mainBody[index];
      }),
      backgroundColor: ThemeColors.backgroundColor,
      extendBody: true,
      bottomNavigationBar: const Navbar(),
    );
  }
}
