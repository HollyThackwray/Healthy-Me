import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:hollythackwray/models/day_model.dart';

class PlanModel {
  final String title;
  final List<DayModel> days;
  final String id;
  final String description;
  final List<String> icons;
  PlanModel({
    required this.title,
    required this.days,
    required this.id,
    required this.description,
    required this.icons,
  });

  PlanModel copyWith({
    String? title,
    List<DayModel>? days,
    String? id,
    String? description,
    List<String>? icons,
  }) {
    return PlanModel(
      title: title ?? this.title,
      days: days ?? this.days,
      id: id ?? this.id,
      description: description ?? this.description,
      icons: icons ?? this.icons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'days': days.map((x) => x.toMap()).toList(),
      'id': id,
      'description': description,
      'icons': icons,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      title: map['title'],
      days: List<DayModel>.from(map['days']?.map((x) => DayModel.fromMap(x))),
      id: map['id'],
      description: map['description'],
      icons: List<String>.from(map['icons']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) => PlanModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlanModel(title: $title, days: $days, id: $id, description: $description, icons: $icons)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PlanModel &&
      other.title == title &&
      listEquals(other.days, days) &&
      other.id == id &&
      other.description == description &&
      listEquals(other.icons, icons);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      days.hashCode ^
      id.hashCode ^
      description.hashCode ^
      icons.hashCode;
  }
}
