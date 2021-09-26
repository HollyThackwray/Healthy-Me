import 'dart:convert';

class NotesModel {
  final String note;
  final String userId;
  NotesModel({
    required this.note,
    required this.userId,
  });

  NotesModel copyWith({
    String? note,
    String? userId,
  }) {
    return NotesModel(
      note: note ?? this.note,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'userId': userId,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      note: map['note'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) => NotesModel.fromMap(json.decode(source));

  @override
  String toString() => 'NotesModel(note: $note, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NotesModel &&
      other.note == note &&
      other.userId == userId;
  }

  @override
  int get hashCode => note.hashCode ^ userId.hashCode;
}
