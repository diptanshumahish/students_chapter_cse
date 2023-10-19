import "package:flutter/material.dart";

class NavTab extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final int tabSelected;
  final int tabIndex;

  const NavTab(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.tabIndex,
      required this.text,
      required this.tabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: tabIndex == tabSelected ? Colors.white : Colors.white38,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: tabIndex == tabSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: tabIndex == tabSelected ? Colors.white : Colors.white38),
          )
        ],
      ),
    );
  }
}
