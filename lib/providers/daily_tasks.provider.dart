import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students_chapter_cse/models/user.model.dart';

class DailyTaskNotifier extends StateNotifier<List<DailyTask>> {
  //initial load
  DailyTaskNotifier(state) : super(state) {
    _loadDailyTasks();
  }

  void addTasks(DailyTask d) {
    state.add(d);
    _saveDailyTasksData();
  }

  void editTasks(
    String taskId,
    String? completionTime,
    int? point,
    String? task,
  ) {
    final index = state.indexWhere((dailyTask) => dailyTask.taskId == taskId);

    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(
              completionTime: completionTime ?? state[i].completionTime,
              point: point ?? state[i].point,
              task: task ?? state[i].task,
            )
          else
            state[i],
      ];

      _saveDailyTasksData();
    }
  }

  static const _taskKey = "daily_tasks";
  Future<void> _loadDailyTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyTasks = prefs.getString(_taskKey);
    if (dailyTasks != null) {
      final List<dynamic> decodedTasks = jsonDecode(dailyTasks);
      final List<DailyTask> dailyTasksFinal =
          decodedTasks.map((taskJson) => DailyTask.fromJson(taskJson)).toList();
      state = dailyTasksFinal;
    }
  }

  Future<void> _saveDailyTasksData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> dailyTasksData =
        state.map((task) => task.toJson()).toList();
    prefs.setString(_taskKey, jsonEncode(dailyTasksData));
  }
}

final dailyTaskProvider =
    StateNotifierProvider<DailyTaskNotifier, List<DailyTask>>(
        (ref) => DailyTaskNotifier([]));
