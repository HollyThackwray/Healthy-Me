import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hollythackwray/models/exercise_model.dart';
import 'notes_model.dart';

class ProgramModel {
  List<ExerciseModel> exercises;
  List<ExerciseModel> streches;
  final int? date;
  List<NotesModel> myNotes;
  final bool? completedStrech;
  final bool? completedExercise;
  final bool? clientUpdate;
  final bool? professionalUpdate;
  List<NotesModel> notes;
  ProgramModel({
    required this.exercises,
    required this.streches,
    this.date,
    required this.myNotes,
    this.completedStrech,
    this.completedExercise,
    this.clientUpdate,
    this.professionalUpdate,
    required this.notes,
  });

  ProgramModel copyWith({
    List<ExerciseModel>? exercises,
    List<ExerciseModel>? streches,
    int? date,
    List<NotesModel>? myNotes,
    bool? completedStrech,
    bool? completedExercise,
    bool? clientUpdate,
    bool? professionalUpdate,
    List<NotesModel>? notes,
  }) {
    return ProgramModel(
      exercises: exercises ?? this.exercises,
      streches: streches ?? this.streches,
      date: date ?? this.date,
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
      'streches': streches.map((x) => x.toMap()).toList(),
      'date': date,
      'myNotes': myNotes.map((x) => x.toMap()).toList(),
      'completedStrech': completedStrech,
      'completedExercise': completedExercise,
      'clientUpdate': clientUpdate,
      'professionalUpdate': professionalUpdate,
      'notes': notes.map((x) => x.toMap()).toList(),
    };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map) {
    return ProgramModel(
      exercises: List<ExerciseModel>.from(map['exercises']?.map((x) => ExerciseModel.fromMap(x))),
      streches: List<ExerciseModel>.from(map['streches']?.map((x) => ExerciseModel.fromMap(x))),
      date: map['date'],
      myNotes: List<NotesModel>.from(map['myNotes']?.map((x) => NotesModel.fromMap(x))),
      completedStrech: map['completedStrech'],
      completedExercise: map['completedExercise'],
      clientUpdate: map['clientUpdate'],
      professionalUpdate: map['professionalUpdate'],
      notes: List<NotesModel>.from(map['notes']?.map((x) => NotesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramModel.fromJson(String source) => ProgramModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProgramModel(exercises: $exercises, streches: $streches, date: $date, myNotes: $myNotes, completedStrech: $completedStrech, completedExercise: $completedExercise, clientUpdate: $clientUpdate, professionalUpdate: $professionalUpdate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProgramModel &&
        listEquals(other.exercises, exercises) &&
        listEquals(other.streches, streches) &&
        other.date == date &&
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
        streches.hashCode ^
        date.hashCode ^
        myNotes.hashCode ^
        completedStrech.hashCode ^
        completedExercise.hashCode ^
        clientUpdate.hashCode ^
        professionalUpdate.hashCode ^
        notes.hashCode;
  }
}
