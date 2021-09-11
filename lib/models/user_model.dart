import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? userId;
  final List<String>? currentProgram;
  final bool? notifications;
  UserModel({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.userId,
    this.currentProgram,
    this.notifications,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? userId,
    List<String>? currentProgram,
    bool? notifications,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userId: userId ?? this.userId,
      currentProgram: currentProgram ?? this.currentProgram,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'currentProgram': currentProgram,
      'notifications': notifications,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userId: map['userId'],
      currentProgram: List<String>.from(map['currentProgram']),
      notifications: map['notifications'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, firstName: $firstName, lastName: $lastName, userId: $userId, currentProgram: $currentProgram, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.username == username &&
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.userId == userId &&
      listEquals(other.currentProgram, currentProgram) &&
      other.notifications == notifications;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      userId.hashCode ^
      currentProgram.hashCode ^
      notifications.hashCode;
  }
}
