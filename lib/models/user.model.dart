// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String membershipId;
  final int yearOfPassOut;
  final int yearOfAdmission;
  final String profilePicture;
  final int points;
  final Role role;
  final bool isVerified;
  final List<DailyTask> dailyTasks;
  final bool isCoreMember;

  User(
      {required this.name,
      required this.membershipId,
      required this.yearOfPassOut,
      required this.profilePicture,
      required this.yearOfAdmission,
      required this.dailyTasks,
      required this.isCoreMember,
      required this.isVerified,
      required this.points,
      required this.role});

  User copyWith({
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
    return User(
      name: name ?? this.name,
      membershipId: membershipId ?? this.membershipId,
      yearOfPassOut: yearOfPassOut ?? this.yearOfPassOut,
      yearOfAdmission: yearOfAdmission ?? this.yearOfAdmission,
      profilePicture: profilePicture ?? this.profilePicture,
      points: points ?? this.points,
      role: role ?? this.role,
      isVerified: isVerified ?? this.isVerified,
      dailyTasks: dailyTasks ?? this.dailyTasks,
      isCoreMember: isCoreMember ?? this.isCoreMember,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'membershipId': membershipId,
      'yearOfPassOut': yearOfPassOut,
      'profilePicture': profilePicture,
      'yearOfAdmission': yearOfAdmission,
      'dailyTasks': dailyTasks.map((task) => task.toJson()).toList(),
      'isCoreMember': isCoreMember,
      'isVerified': isVerified,
      'points': points,
      'role': role.toString(), // Convert enum to string
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      membershipId: json['membershipId'],
      yearOfPassOut: json['yearOfPassOut'],
      profilePicture: json['profilePicture'],
      yearOfAdmission: json['yearOfAdmission'],
      dailyTasks: (json['dailyTasks'] as List)
          .map((taskJson) => DailyTask.fromJson(taskJson))
          .toList(),
      isCoreMember: json['isCoreMember'],
      isVerified: json['isVerified'],
      points: json['points'],
      role: Role.values.firstWhere(
        (e) => e.toString() == json['role'],
        orElse: () => Role.userLow, // Default value if not found
      ),
    );
  }
}

class DailyTask {
  final String taskId;
  final String completionTime;
  final int point;
  final String task;

  DailyTask(
      {required this.taskId,
      required this.completionTime,
      required this.point,
      required this.task});
  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'completionTime': completionTime,
      'point': point,
      'task': task,
    };
  }

  factory DailyTask.fromJson(Map<String, dynamic> json) {
    return DailyTask(
      taskId: json['taskId'],
      completionTime: json['completionTime'],
      point: json['point'],
      task: json['task'],
    );
  }

  DailyTask copyWith({
    String? taskId,
    String? completionTime,
    int? point,
    String? task,
  }) {
    return DailyTask(
      taskId: taskId ?? this.taskId,
      completionTime: completionTime ?? this.completionTime,
      point: point ?? this.point,
      task: task ?? this.task,
    );
  }
}

enum Role { superAdmin, admin, userLow, userUp }


//! superAdmin will only be able to add admins, (rest all features same)
//! admin will be able to add other members to the system, and also mark the starting of an event.
