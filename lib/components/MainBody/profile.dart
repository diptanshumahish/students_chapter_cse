import 'package:flutter/material.dart';
import 'package:students_chapter_cse/components/dev/dev_user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SliverToBoxAdapter(
          child: DevUser(),
        )
      ],
    );
  }
}
