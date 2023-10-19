import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:students_chapter_cse/providers/user.providers.dart";
import "package:students_chapter_cse/themes/theme_colors.dart";

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer(builder: ((context, ref, child) {
      final userDetails = ref.watch(userProvider);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: height / 3.5,
            width: width,
            decoration: BoxDecoration(
                color: const Color.fromARGB(28, 22, 87, 143),
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(width / 20)),
            child: Padding(
              padding: EdgeInsets.all(width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Reputation",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            userDetails.points.toString(),
                            style: const TextStyle(
                                fontSize: 35,
                                color: ThemeColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome,",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            userDetails.name.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userDetails.membershipId.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        child: Icon(FeatherIcons.user),
                      )
                    ],
                  )
                ],
              ),
            )),
      );
    }));
  }
}
