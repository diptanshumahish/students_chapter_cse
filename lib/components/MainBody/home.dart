import 'package:flutter/material.dart';
import 'package:students_chapter_cse/components/MainBody/Home/top_banner.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [SliverToBoxAdapter(child: SafeArea(child: TopBanner()))],
    );
  }
}
