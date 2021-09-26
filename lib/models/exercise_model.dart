import 'dart:convert';

class ExerciseModel {
  final int? sets;
  final int? reps;
  final int? duration;
  final String? name;
  final String? notes;
  final bool isCompleted;
  ExerciseModel({
    this.sets,
    this.reps,
    required this.duration,
    this.name,
    this.notes,
    required this.isCompleted,
  });

  ExerciseModel copyWith({
    int? sets,
    int? reps,
    int? duration,
    String? name,
    String? notes,
    bool? isCompleted,
  }) {
    return ExerciseModel(
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sets': sets,
      'reps': reps,
      'duration': duration,
      'name': name,
      'notes': notes,
      'isCompleted': isCompleted,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      sets: map['sets'],
      reps: map['reps'],
      duration: map['duration'],
      name: map['name'],
      notes: map['notes'],
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) => ExerciseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciseModel(sets: $sets, reps: $reps, duration: $duration, name: $name, notes: $notes, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseModel &&
        other.sets == sets &&
        other.reps == reps &&
        other.duration == duration &&
        other.name == name &&
        other.notes == notes &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return sets.hashCode ^ reps.hashCode ^ duration.hashCode ^ name.hashCode ^ notes.hashCode ^ isCompleted.hashCode;
  }
}
