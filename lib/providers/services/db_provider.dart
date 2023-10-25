import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class UnableToOpenDatabaseException implements Exception {
  final String message;
  const UnableToOpenDatabaseException(this.message);
}

class DatabaseAlreadyOpenedException implements Exception {
  final String message;
  const DatabaseAlreadyOpenedException(this.message);
}

class UserAlreadyExistsException implements Exception {
  final String message;
  const UserAlreadyExistsException(this.message);
}

class DatabaseIsNotOpen implements Exception {
  final String message;
  const DatabaseIsNotOpen(this.message);
}

class CouldNotDeleteUser implements Exception {
  final String message;
  const CouldNotDeleteUser(this.message);
}

class CouldNotFindUser implements Exception {
  final String message;
  const CouldNotFindUser(this.message);
}

class UserService {
  Database? _db;

  List<DatabaseUser> _users = [];

  final _usersStreamController =
      StreamController<List<DatabaseUser>>.broadcast();

  Future<DatabaseUser> getOrCreateUser(
      {required String email,
      required String name,
      required String membershipId,
      required int yearOfPassOut,
      required int yearOfAdmission,
      required String profilePicture,
      required int points,
      required String stream,
      required int mobileNumber,
      required bool isVerified,
      required bool isLoggedIn,
      required bool isCoreMember}) async {
    try {
      final user = await getUser(email: email);
      return user;
    } on CouldNotFindUser {
      final createdUser = await createUser(
          email,
          name,
          membershipId,
          yearOfPassOut,
          yearOfAdmission,
          profilePicture,
          points,
          stream,
          mobileNumber,
          isVerified,
          isLoggedIn,
          isCoreMember);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _cacheUsers() async {
    final allUsers = await getAllUsers();
    _users = allUsers.toList();
    _usersStreamController.add(_users);
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw const DatabaseIsNotOpen('Database is not opened');
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on databaseA {}
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw const DatabaseIsNotOpen('Database is not opened');
    } else {
      return db;
    }
  }

  Future<void> deleteUser({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deletedCoutnt =
        await db.delete(userTable, where: 'id = ?', whereArgs: [id]);
    if (deletedCoutnt == 0) {
      throw CouldNotDeleteUser('Could not delete user');
    } else {
      _users.removeWhere((element) => element.id == id);
      _usersStreamController.add(_users);
    }
  }

  Future<DatabaseUser> getUser({required String email}) async {
    final db = _getDatabaseOrThrow();

    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );

    if (results.isEmpty) {
      throw CouldNotFindUser('User not found');
    } else {
      final users = DatabaseUser.fromRow(results.first);
      _users.removeWhere((element) => element.email == email);
      _users.add(users);
      _usersStreamController.add(_users);
      return users;
    }
  }

  Future<Iterable<DatabaseUser>> getAllUsers() async {
    final db = _getDatabaseOrThrow();
    final dbUsers = await db.query(userTable);

    return dbUsers.map((userRow) => DatabaseUser.fromRow(userRow));
  }

  Future<DatabaseUser> createUser(
      String email,
      String name,
      String membershipId,
      int yearOfPassOut,
      int yearOfAdmission,
      String profilePicture,
      int points,
      String stream,
      int mobileNumber,
      bool isVerified,
      bool isLoggedIn,
      bool isCoreMember) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (results.isNotEmpty) {
      throw UserAlreadyExistsException("User already exists");
    }

    final userId = await db.insert(
      userTable,
      {emailColumn: email.toLowerCase()},
    );

    final UserList = DatabaseUser(
      id: userId,
      name: name,
      membershipId: membershipId,
      yearOfPassOut: yearOfPassOut,
      yearOfAdmission: yearOfAdmission,
      profilePicture: profilePicture,
      points: points,
      stream: stream,
      mobileNumber: mobileNumber,
      email: email,
      isVerified: isVerified,
      isLoggedIn: isLoggedIn,
      isCoreMember: isCoreMember,
    );

    _users.add(UserList);
    _usersStreamController.add(_users);

    return UserList;
  }

  Future<void> open() async {
    if (_db == null) {
      DatabaseAlreadyOpenedException("Exception to be returned");
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createUserTableQuery);
      await _cacheUsers();
    } on MissingPlatformDirectoryException {
      throw const UnableToOpenDatabaseException('Unable to open database');
    }
  }
}

@immutable
class DatabaseUser {
  final int id;
  final String name;
  final String membershipId;
  final int yearOfPassOut;
  final int yearOfAdmission;
  final String profilePicture;
  final int points;
  // final Role role;
  final String stream;
  final int mobileNumber;
  final String email;
  final bool isVerified;
  final bool isLoggedIn; // Added field
  // final List<DailyTask> dailyTasks;
  final bool isCoreMember;

  const DatabaseUser({
    required this.id,
    required this.name,
    required this.membershipId,
    required this.yearOfPassOut,
    required this.yearOfAdmission,
    required this.profilePicture,
    required this.points,
    required this.stream,
    required this.mobileNumber,
    required this.email,
    required this.isVerified,
    required this.isLoggedIn,
    required this.isCoreMember,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        name = map[nameColumn] as String,
        membershipId = map[membershipIdColumn] as String,
        yearOfPassOut = map[yearOfPassOutColumn] as int,
        yearOfAdmission = map[yearOfAdmissionColumn] as int,
        profilePicture = map[profilePictureColumn] as String,
        points = map[pointsColumn] as int,
        stream = map[streamColumn] as String,
        mobileNumber = map[mobileNumberColumn] as int,
        email = map[emailColumn] as String,
        isVerified = map[isVerifiedColumn] == 1 ? true : false,
        isLoggedIn = map[isLoggedInColumn] == 1 ? true : false,
        isCoreMember = map[isCoreMemberColumn] == 1 ? true : false;

  @override
  String toString() =>
      'UserData, id: $id, name: $name, membershipId: $membershipId, yearOfPassOut: $yearOfPassOut, yearOfAdmission: $yearOfAdmission, profilePicture: $profilePicture, points: $points, stream: $stream, mobileNumber: $mobileNumber, email: $email, isVerified: $isVerified, isLoggedIn: $isLoggedIn, isCoreMember: $isCoreMember';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbName = 'notes.db';
const userTable = 'users';
const idColumn = 'id';
const nameColumn = 'name';
const membershipIdColumn = 'membershipId';
const yearOfPassOutColumn = 'yearOfPassOut';
const yearOfAdmissionColumn = 'yearOfAdmission';
const profilePictureColumn = 'profilePicture';
const pointsColumn = 'points';
const streamColumn = 'stream';
const mobileNumberColumn = 'mobileNumber';
const emailColumn = 'email';
const isVerifiedColumn = 'isVerified';
const isLoggedInColumn = 'isLoggedIn';
const isCoreMemberColumn = 'isCoreMember';
const createUserTableQuery = ''' CREATE TABLE "users" (
          "id"	INTEGER NOT NULL,
          "name"	TEXT NOT NULL,
          "membershipId"	TEXT NOT NULL,
          "yearOfPassOut"	INTEGER NOT NULL,
          "yearOfAdmission"	INTEGER NOT NULL,
          "profilePicture"	TEXT NOT NULL,
          "points"	INTEGER NOT NULL,
          "stream"	TEXT NOT NULL,
          "mobileNumber"	INTEGER NOT NULL,
          "email"	TEXT NOT NULL,
          "isVerified"	INTEGER NOT NULL,
          "isLoggedIn"	INTEGER NOT NULL,
          "isCoreMember"	INTEGER NOT NULL,
          PRIMARY KEY("id" AUTOINCREMENT)
        )

      ''';
