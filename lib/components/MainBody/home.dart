import 'package:flutter/material.dart';
import 'package:students_chapter_cse/components/MainBody/Home/top_banner.dart';
import 'package:students_chapter_cse/components/MainBody/Home/upcoming_banner.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/page/assetback.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: SafeArea(bottom: false, child: TopBanner())),
            SliverToBoxAdapter(
              child: UpcomingBanner(),
            )
          ],
        )
      ],
    );
  }
}
