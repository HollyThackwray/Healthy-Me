import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:hollythackwray/models/current_plan_model.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? firstName;
  final String? profilePic;
  final String? lastName;
  final String? userId;
  final List<CurrentPlanModel>? currentProgram;
  final bool? notifications;
  UserModel({
    this.username,
    this.email,
    this.firstName,
    this.profilePic,
    this.lastName,
    this.userId,
    this.currentProgram,
    this.notifications,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? firstName,
    String? profilePic,
    String? lastName,
    String? userId,
    List<CurrentPlanModel>? currentProgram,
    bool? notifications,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      profilePic: profilePic ?? this.profilePic,
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
      'profilePic': profilePic,
      'lastName': lastName,
      'userId': userId,
      'currentProgram': currentProgram?.map((x) => x.toMap()).toList(),
      'notifications': notifications,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      firstName: map['firstName'],
      profilePic: map['profilePic'],
      lastName: map['lastName'],
      userId: map['userId'],
      currentProgram: List<CurrentPlanModel>.from(map['currentProgram']?.map((x) => CurrentPlanModel.fromMap(x))),
      notifications: map['notifications'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, firstName: $firstName, profilePic: $profilePic, lastName: $lastName, userId: $userId, currentProgram: $currentProgram, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.username == username &&
      other.email == email &&
      other.firstName == firstName &&
      other.profilePic == profilePic &&
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
      profilePic.hashCode ^
      lastName.hashCode ^
      userId.hashCode ^
      currentProgram.hashCode ^
      notifications.hashCode;
  }
}
