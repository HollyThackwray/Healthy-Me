import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'exercise_model.dart';
import 'notes_model.dart';

class UserProgramModel {
  List<ExerciseModel> exercises;
  String programId;
  List<ExerciseModel> streches;
  int date;
  String userId;
  List<String> myNotes;
  bool? completedStrech;
  bool? completedExercise;
  bool? clientUpdate;
  bool? professionalUpdate;
  List<NotesModel> notes;
  UserProgramModel({
    required this.exercises,
    required this.programId,
    required this.streches,
    required this.date,
    required this.userId,
   required this.myNotes,
    this.completedStrech,
    this.completedExercise,
    this.clientUpdate,
    this.professionalUpdate,
    required this.notes,
  });

  UserProgramModel copyWith({
    List<ExerciseModel>? exercises,
    String? programId,
    List<ExerciseModel>? streches,
    int? date,
    String? userId,
    List<String>? myNotes,
    bool? completedStrech,
    bool? completedExercise,
    bool? clientUpdate,
    bool? professionalUpdate,
    List<NotesModel>? notes,
  }) {
    return UserProgramModel(
      exercises: exercises ?? this.exercises,
      programId: programId ?? this.programId,
      streches: streches ?? this.streches,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      myNotes: myNotes ?? this.myNotes,
      completedStrech: completedStrech ?? this.completedStrech,
      completedExercise: completedExercise ?? this.completedExercise,
      clientUpdate: clientUpdate ?? this.clientUpdate,
      professionalUpdate: professionalUpdate ?? this.professionalUpdate,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exercises': exercises.map((x) => x.toMap()).toList(),
      'programId': programId,
      'streches': streches.map((x) => x.toMap()).toList(),
      'date': date,
      'userId': userId,
      'myNotes': myNotes,
      'completedStrech': completedStrech,
      'completedExercise': completedExercise,
      'clientUpdate': clientUpdate,
      'professionalUpdate': professionalUpdate,
      'notes': notes.map((x) => x.toMap()).toList(),
    };
  }

  factory UserProgramModel.fromMap(Map<String, dynamic> map) {
    return UserProgramModel(
      exercises: List<ExerciseModel>.from(map['exercises']?.map((x) => ExerciseModel.fromMap(x))),
      programId: map['programId'],
      streches: List<ExerciseModel>.from(map['streches']?.map((x) => ExerciseModel.fromMap(x))),
      date: map['date'],
      userId: map['userId'],
      myNotes: List<String>.from(map['myNotes']),
      completedStrech: map['completedStrech'],
      completedExercise: map['completedExercise'],
      clientUpdate: map['clientUpdate'],
      professionalUpdate: map['professionalUpdate'],
      notes: List<NotesModel>.from(map['notes']?.map((x) => NotesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProgramModel.fromJson(String source) => UserProgramModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProgramModel(exercises: $exercises, programId: $programId, streches: $streches, date: $date, userId: $userId, myNotes: $myNotes, completedStrech: $completedStrech, completedExercise: $completedExercise, clientUpdate: $clientUpdate, professionalUpdate: $professionalUpdate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserProgramModel &&
      listEquals(other.exercises, exercises) &&
      other.programId == programId &&
      listEquals(other.streches, streches) &&
      other.date == date &&
      other.userId == userId &&
      listEquals(other.myNotes, myNotes) &&
      other.completedStrech == completedStrech &&
      other.completedExercise == completedExercise &&
      other.clientUpdate == clientUpdate &&
      other.professionalUpdate == professionalUpdate &&
      listEquals(other.notes, notes);
  }

  @override
  int get hashCode {
    return exercises.hashCode ^
      programId.hashCode ^
      streches.hashCode ^
      date.hashCode ^
      userId.hashCode ^
      myNotes.hashCode ^
      completedStrech.hashCode ^
      completedExercise.hashCode ^
      clientUpdate.hashCode ^
      professionalUpdate.hashCode ^
      notes.hashCode;
  }
}
