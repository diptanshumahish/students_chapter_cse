import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:students_chapter_cse/Screens/main_screen.dart';
import 'package:students_chapter_cse/themes/theme_colors.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const MainScreen(), type: PageTransitionType.bottomToTop));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: ThemeColors.backgroundColor,
      height: height,
      width: width,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 5),
                child: Image.asset("assets/backgrounds/sc.png"),
              ),
            ),
            Positioned(
                bottom: height / 4,
                left: 0,
                right: 0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  ],
                )),
            Positioned(
                bottom: height / 8,
                left: 0,
                right: 0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Version 0.0.0 beta 1",
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
