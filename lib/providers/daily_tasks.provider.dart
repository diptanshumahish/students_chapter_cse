import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students_chapter_cse/models/user.model.dart';

class DailyTaskNotifier extends StateNotifier<DailyTask> {
  //initial load
  DailyTaskNotifier(state) : super(state) {
    _loadDailyTasks();
  }

  void addTasks(DailyTask d) {
    state = d;
    _saveDailyTasksData();
  }

  void editTasks(
    String? completionTime,
    int? point,
    String? task,
  ) {
    state = state.copyWith(
        completionTime: completionTime ?? state.completionTime,
        point: point ?? state.point,
        task: task ?? state.task);
  }

  static const _taskKey = "daily_tasks";
  Future<void> _loadDailyTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyTasks = prefs.getString(_taskKey);
    if (dailyTasks != null) {
      final dailyTasksFinal = DailyTask.fromJson(jsonDecode(dailyTasks));
      state = dailyTasksFinal;
    }
  }

  Future<void> _saveDailyTasksData() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyTasksData = state.toJson();
    prefs.setString(_taskKey, jsonEncode(dailyTasksData));
  }
}
