import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:students_chapter_cse/components/Navbar/tab.dart";
import "package:students_chapter_cse/providers/tab.provider.dart";

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final selectedTab = ref.watch(tabProvider);
    final changeTab = ref.read(tabProvider.notifier);

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: width / 20, horizontal: width / 20),
      child: Container(
        height: height / 12,
        width: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(13, 178, 247, 255),
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(width / 10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavTab(
                  onTap: () {
                    changeTab.updateTab(0);
                  },
                  icon: FeatherIcons.home,
                  text: "Home",
                  tabIndex: 0,
                  tabSelected: selectedTab),
              NavTab(
                  onTap: () {
                    changeTab.updateTab(1);
                  },
                  icon: FeatherIcons.activity,
                  text: "Daily",
                  tabIndex: 1,
                  tabSelected: selectedTab),
              NavTab(
                  onTap: () {
                    changeTab.updateTab(2);
                  },
                  icon: FeatherIcons.award,
                  text: "Events",
                  tabIndex: 2,
                  tabSelected: selectedTab),
              NavTab(
                  onTap: () {
                    changeTab.updateTab(3);
                  },
                  icon: FeatherIcons.user,
                  text: "Profile",
                  tabIndex: 3,
                  tabSelected: selectedTab),
            ],
          ),
        ),
      ),
    );
  }
}
