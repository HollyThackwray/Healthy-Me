import 'dart:convert';

class StrechModel {
  final String? name;
  final int? duration;
  final String? manyTimes;
  StrechModel({
    this.name,
    this.duration,
    this.manyTimes,
  });

  StrechModel copyWith({
    String? name,
    int? duration,
    String? manyTimes,
  }) {
    return StrechModel(
      name: name ?? this.name,
      duration: duration ?? this.duration,
      manyTimes: manyTimes ?? this.manyTimes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'duration': duration,
      'manyTimes': manyTimes,
    };
  }

  factory StrechModel.fromMap(Map<String, dynamic> map) {
    return StrechModel(
      name: map['name'],
      duration: map['duration'],
      manyTimes: map['manyTimes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StrechModel.fromJson(String source) => StrechModel.fromMap(json.decode(source));

  @override
  String toString() => 'StrechModel(name: $name, duration: $duration, manyTimes: $manyTimes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StrechModel &&
      other.name == name &&
      other.duration == duration &&
      other.manyTimes == manyTimes;
  }

  @override
  int get hashCode => name.hashCode ^ duration.hashCode ^ manyTimes.hashCode;
}
