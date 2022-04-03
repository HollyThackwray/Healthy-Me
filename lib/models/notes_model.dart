import 'dart:convert';

class NotesModel {
  final String note;
  final String username;
  
  NotesModel({
    required this.note,
    required this.username,
  });

  NotesModel copyWith({
    String? note,
    String? username,
  }) {
    return NotesModel(
      note: note ?? this.note,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'username': username,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      note: map['note'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) => NotesModel.fromMap(json.decode(source));

  @override
  String toString() => 'NotesModel(note: $note, username: $username)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NotesModel &&
      other.note == note &&
      other.username == username;
  }

  @override
  int get hashCode => note.hashCode ^ username.hashCode;
}
