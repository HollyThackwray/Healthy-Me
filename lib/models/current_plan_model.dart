import 'dart:convert';

class CurrentPlanModel {
  final String id;
  final int date;
  CurrentPlanModel({
    required this.id,
    required this.date,
  });
  

  CurrentPlanModel copyWith({
    String? id,
    int? date,
  }) {
    return CurrentPlanModel(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
    };
  }

  factory CurrentPlanModel.fromMap(Map<String, dynamic> map) {
    return CurrentPlanModel(
      id: map['id'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentPlanModel.fromJson(String source) => CurrentPlanModel.fromMap(json.decode(source));

  @override
  String toString() => 'CurrentPlanModel(id: $id, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CurrentPlanModel &&
      other.id == id &&
      other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ date.hashCode;
}
