import 'dart:convert';
import 'package:flutter/foundation.dart';

class DayModel {
  final String? name;
  final List<DataModel>? data;
  DayModel({
    required this.name,
    required this.data,
  });

  DayModel copyWith({
    String? name,
    List<DataModel>? data,
  }) {
    return DayModel(
      name: name ?? this.name,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      name: map['name'],
      data: List<DataModel>.from(map['data']?.map((x) => DataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DayModel.fromJson(String source) => DayModel.fromMap(json.decode(source));

  @override
  String toString() => 'DayModel(name: $name, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DayModel &&
      other.name == name &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => name.hashCode ^ data.hashCode;
}

class DataModel {
  final String? notification;
  final String? title;
  final String? icon;
  final String? subtitle;
  DataModel({
    required this.notification,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  DataModel copyWith({
    String? notification,
    String? title,
    String? icon,
    String? subtitle,
  }) {
    return DataModel(
      notification: notification ?? this.notification,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notification': notification,
      'title': title,
      'icon': icon,
      'subtitle': subtitle,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      notification: map['notification'],
      title: map['title'],
      icon: map['icon'],
      subtitle: map['subtitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataModel(notification: $notification, title: $title, icon: $icon, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataModel &&
      other.notification == notification &&
      other.title == title &&
      other.icon == icon &&
      other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return notification.hashCode ^
      title.hashCode ^
      icon.hashCode ^
      subtitle.hashCode;
  }
}
