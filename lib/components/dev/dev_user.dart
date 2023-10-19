//! to be deleted later on

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:students_chapter_cse/models/user.model.dart";
import "package:students_chapter_cse/providers/user.providers.dart";

class DevUser extends ConsumerWidget {
  const DevUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final change = ref.read(userProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const Text("Assign Default user data"),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                change.firstLogin(User(
                    name: "Diptanshu Mahish",
                    membershipId: "ABCD/2021/002",
                    yearOfPassOut: 2025,
                    profilePicture: "",
                    yearOfAdmission: 2021,
                    dailyTasks: [],
                    isCoreMember: true,
                    isVerified: true,
                    points: 0,
                    role: Role.admin,
                    stream: "CSE3",
                    mobileNumber: 8961603453,
                    email: "diptanshu.mahish.21@aot.edu.in",
                    isLogged_in: true));
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text("Clear Default User"),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                change.resetUser();
              },
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
