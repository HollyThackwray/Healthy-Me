import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:hollythackwray/models/exercise_model.dart';
import 'package:hollythackwray/models/strech_model.dart';

class ProgramModel {
  final List<ExerciseModel>? exercises;
  final List<StrechModel>? streches;
  final int? date;
  final String? myNotes;
  final String? professionalNotes;
  final bool? completed;
  final bool? clientUpdate;
  final bool? professionalUpdate;
  ProgramModel({
    this.exercises,
    this.streches,
    this.date,
    this.myNotes,
    this.professionalNotes,
    this.completed,
    this.clientUpdate,
    this.professionalUpdate,
  });

  ProgramModel copyWith({
    List<ExerciseModel>? exercises,
    List<StrechModel>? streches,
    int? date,
    String? myNotes,
    String? professionalNotes,
    bool? completed,
    bool? clientUpdate,
    bool? professionalUpdate,
  }) {
    return ProgramModel(
      exercises: exercises ?? this.exercises,
      streches: streches ?? this.streches,
      date: date ?? this.date,
      myNotes: myNotes ?? this.myNotes,
      professionalNotes: professionalNotes ?? this.professionalNotes,
      completed: completed ?? this.completed,
      clientUpdate: clientUpdate ?? this.clientUpdate,
      professionalUpdate: professionalUpdate ?? this.professionalUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exercises': exercises?.map((x) => x.toMap()).toList(),
      'streches': streches?.map((x) => x.toMap()).toList(),
      'date': date,
      'myNotes': myNotes,
      'professionalNotes': professionalNotes,
      'completed': completed,
      'clientUpdate': clientUpdate,
      'professionalUpdate': professionalUpdate,
    };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map) {
    return ProgramModel(
      exercises: List<ExerciseModel>.from(map['exercises']?.map((x) => ExerciseModel.fromMap(x))),
      streches: List<StrechModel>.from(map['streches']?.map((x) => StrechModel.fromMap(x))),
      date: map['date'],
      myNotes: map['myNotes'],
      professionalNotes: map['professionalNotes'],
      completed: map['completed'],
      clientUpdate: map['clientUpdate'],
      professionalUpdate: map['professionalUpdate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramModel.fromJson(String source) => ProgramModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProgramModel(exercises: $exercises, streches: $streches, date: $date, myNotes: $myNotes, professionalNotes: $professionalNotes, completed: $completed, clientUpdate: $clientUpdate, professionalUpdate: $professionalUpdate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProgramModel &&
      listEquals(other.exercises, exercises) &&
      listEquals(other.streches, streches) &&
      other.date == date &&
      other.myNotes == myNotes &&
      other.professionalNotes == professionalNotes &&
      other.completed == completed &&
      other.clientUpdate == clientUpdate &&
      other.professionalUpdate == professionalUpdate;
  }

  @override
  int get hashCode {
    return exercises.hashCode ^
      streches.hashCode ^
      date.hashCode ^
      myNotes.hashCode ^
      professionalNotes.hashCode ^
      completed.hashCode ^
      clientUpdate.hashCode ^
      professionalUpdate.hashCode;
  }
}
