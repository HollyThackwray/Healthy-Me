import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:hollythackwray/models/current_plan_model.dart';
import 'package:hollythackwray/models/program_model.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? firstName;
  final String? profilePic;
  final String? lastName;
  final String? userId;
  final bool? professionalAccount;
  final List<CurrentPlanModel?>? currentProgram;
  final bool? notifications;
  final ProgramModel? programs;
  final List<double>? weight;
  final List<String>? trainers;
  UserModel({
    this.username,
    this.email,
    this.firstName,
    this.profilePic,
    this.lastName,
    this.userId,
    this.professionalAccount,
    this.currentProgram,
    this.notifications,
    this.programs,
    this.weight,
    this.trainers,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? firstName,
    String? profilePic,
    String? lastName,
    String? userId,
    bool? professionalAccount,
    List<CurrentPlanModel>? currentProgram,
    bool? notifications,
    ProgramModel? programs,
    List<double>? weight,
    List<String>? trainers,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      profilePic: profilePic ?? this.profilePic,
      lastName: lastName ?? this.lastName,
      userId: userId ?? this.userId,
      professionalAccount: professionalAccount ?? this.professionalAccount,
      currentProgram: currentProgram ?? this.currentProgram,
      notifications: notifications ?? this.notifications,
      programs: programs ?? this.programs,
      weight: weight ?? this.weight,
      trainers: trainers ?? this.trainers,
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
      'professionalAccount': professionalAccount,
      'currentProgram': currentProgram?.map((x) => x!.toMap()).toList(),
      'notifications': notifications,
      'programs': programs?.toMap(),
      'weight': weight,
      'trainers': trainers,
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
      professionalAccount: map['professionalAccount'],
      currentProgram: List<CurrentPlanModel>.from(map['currentProgram']?.map((x) => CurrentPlanModel.fromMap(x))),
      notifications: map['notifications'],
      programs: map['programs'] == null ? null : ProgramModel.fromMap(map['programs']),
      weight: List<double>.from(map['weight']),
      trainers: List<String>.from(map['trainers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, firstName: $firstName, profilePic: $profilePic, lastName: $lastName, userId: $userId, professionalAccount: $professionalAccount, currentProgram: $currentProgram, notifications: $notifications, programs: $programs, weight: $weight, trainers: $trainers)';
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
        other.professionalAccount == professionalAccount &&
        listEquals(other.currentProgram, currentProgram) &&
        other.notifications == notifications &&
        other.programs == programs &&
        listEquals(other.weight, weight) &&
        listEquals(other.trainers, trainers);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        profilePic.hashCode ^
        lastName.hashCode ^
        userId.hashCode ^
        professionalAccount.hashCode ^
        currentProgram.hashCode ^
        notifications.hashCode ^
        programs.hashCode ^
        weight.hashCode ^
        trainers.hashCode;
  }
}
