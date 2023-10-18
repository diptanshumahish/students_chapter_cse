import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students_chapter_cse/Screens/splash_screen.dart';
import 'package:students_chapter_cse/themes/theme_data.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeMain.theme,
      home: const SplashScreen(),
    );
  }
}
