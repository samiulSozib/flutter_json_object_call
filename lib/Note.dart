// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  Note({
    required this.notes,
  });

  List<NoteElement> notes;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        notes: List<NoteElement>.from(
            json["notes"].map((x) => NoteElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
      };
}

class NoteElement {
  NoteElement({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory NoteElement.fromJson(Map<String, dynamic> json) => NoteElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
