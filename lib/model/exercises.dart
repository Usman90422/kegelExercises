// To parse this JSON data, do
//
//     final exericsesModel = exericsesModelFromJson(jsonString);

import 'dart:convert';

ExericsesModel exericsesModelFromJson(String str) => ExericsesModel.fromJson(json.decode(str));

String exericsesModelToJson(ExericsesModel data) => json.encode(data.toJson());

class ExericsesModel {
  ExericsesModel({
    required this.data,
  });

  List<Datum> data;

  factory ExericsesModel.fromJson(Map<String, dynamic> json) => ExericsesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.delay,
    required this.text,
    required this.isActive,
    required this.isEnable,
    required this.v,
    required this.updatedAt,
    required this.createdAt,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
