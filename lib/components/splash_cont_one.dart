import 'package:flutter/material.dart';
import 'package:students_chapter_cse/Screens/main_screen.dart';
import 'package:students_chapter_cse/themes/theme_colors.dart';
import 'package:page_transition/page_transition.dart';

class SplashTwo extends StatefulWidget {
  const SplashTwo({super.key});

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        (const Duration(seconds: 3)),
        () => {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: const MainScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: ThemeColors.backgroundColor,
        )),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: height / 1.6,
              width: width,
              child: Image.asset(
                "assets/backgrounds/background.webp",
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height / 1.6,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Color.fromARGB(125, 18, 18, 20),
                    ThemeColors.backgroundColor
                  ],
                ),
              ),
            )),
        Center(
          child: Image.asset(
            "assets/backgrounds/sc.png",
            width: width / 1.7,
          ),
        ),
        const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Members' App",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Track your daily records, update events, and many more. Make sure you have access from an admin before using this app",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircularProgressIndicator.adaptive(),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Loading",
                                style: TextStyle(color: Colors.white60),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Version 0.0.1 beta",
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
