import 'package:flutter/material.dart';

class Daily extends StatelessWidget {
  const Daily({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            "Daily",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
