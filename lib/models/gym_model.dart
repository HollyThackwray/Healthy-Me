import 'dart:convert';

import 'package:flutter/foundation.dart';

class GymModel {
  final String? gymId;
  final String? name;
  final List<String> gymUsers;
  GymModel({
    this.gymId,
    this.name,
    required this.gymUsers,
  });

  GymModel copyWith({
    String? gymId,
    String? name,
    List<String>? gymUsers,
  }) {
    return GymModel(
      gymId: gymId ?? this.gymId,
      name: name ?? this.name,
      gymUsers: gymUsers ?? this.gymUsers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gymId': gymId,
      'name': name,
      'gymUsers': gymUsers,
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      gymId: map['gymId'],
      name: map['name'],
      gymUsers: List<String>.from(map['gymUsers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) => GymModel.fromMap(json.decode(source));

  @override
  String toString() => 'GymModel(gymId: $gymId, name: $name, gymUsers: $gymUsers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GymModel &&
      other.gymId == gymId &&
      other.name == name &&
      listEquals(other.gymUsers, gymUsers);
  }

  @override
  int get hashCode => gymId.hashCode ^ name.hashCode ^ gymUsers.hashCode;
}
