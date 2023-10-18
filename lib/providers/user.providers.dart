import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students_chapter_cse/models/user.model.dart';

class UserNotifier extends StateNotifier<User> {
  // Initial load.

  UserNotifier(state) : super(state) {
    _loadUserData();
  }

  // first time will update using this.
  void firstLogin(User u) {
    state = u;
    _saveUserData();
  }

  // This one will be used for updating and editing user data
  void updateUser({
    String? name,
    String? membershipId,
    int? yearOfPassOut,
    int? yearOfAdmission,
    String? profilePicture,
    int? points,
    Role? role,
    bool? isVerified,
    List<DailyTask>? dailyTasks,
    bool? isCoreMember,
  }) {
    state = state.copyWith(
      name: name ?? state.name,
      membershipId: membershipId ?? state.membershipId,
      yearOfPassOut: yearOfPassOut ?? state.yearOfPassOut,
      yearOfAdmission: yearOfAdmission ?? state.yearOfAdmission,
      profilePicture: profilePicture ?? state.profilePicture,
      points: points ?? state.points,
      role: role ?? state.role,
      isVerified: isVerified ?? state.isVerified,
      dailyTasks: dailyTasks ?? state.dailyTasks,
      isCoreMember: isCoreMember ?? state.isCoreMember,
    );

    _saveUserData();
  }

  static const _userKey = 'user_data';

  // load data from local storage
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    if (userData != null) {
      final user = User.fromJson(jsonDecode(userData));
      state = user;
    }
  }

  // update data to the local storage
  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = state.toJson();
    prefs.setString(_userKey, jsonEncode(userData));
  }
}
