// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) => SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
    required this.allSessionsDataList,
  });

  List<SessionDataClass> allSessionsDataList;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    allSessionsDataList: List<SessionDataClass>.from(json["data"].map((x) => SessionDataClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(allSessionsDataList.map((x) => x.toJson())),
  };
}

class SessionDataClass {
  SessionDataClass({
    required this.id,
    required this.title,
    required this.description,
    required this.exercises,
    required this.totalTime,
    required this.isActive,
    required this.isEnable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String description;
  List<Exercise> exercises;
  int totalTime;
  bool isActive;
  bool isEnable;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SessionDataClass.fromJson(Map<String, dynamic> json) => SessionDataClass(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
    totalTime: json["total_time"],
    isActive: json["is_active"],
    isEnable: json["is_enable"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
    "total_time": totalTime,
    "is_active": isActive,
    "is_enable": isEnable,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Exercise {
  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.delay,
    required this.text,
    required this.isActive,
    required this.isEnable,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String title;
  String description;
  int time;
  double delay;
  List<Texts> text;
  bool isActive;
  bool isEnable;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    time: json["time"],
    delay: json["delay"].toDouble(),
    text: List<Texts>.from(json["text"].map((x) => Texts.fromJson(x))),
    isActive: json["is_active"],
    isEnable: json["is_enable"],
    v: json["__v"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "time": time,
    "delay": delay,
    "text": List<dynamic>.from(text.map((x) => x.toJson())),
    "is_active": isActive,
    "is_enable": isEnable,
    "__v": v,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Texts {
  Texts({
    required this.en,
    required this.ar,
    required this.id,
  });

  String en;
  String ar;
  String id;

  factory Texts.fromJson(Map<String, dynamic> json) => Texts(
    en: json["en"],
    ar: json["ar"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "ar": ar,
    "_id": id,
  };
}
