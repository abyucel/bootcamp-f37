import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "created_at": createdAt.millisecondsSinceEpoch,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> data) {
    return Hotel(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["created_at"]),
    );
  }

  String toJson() => jsonEncode(toMap());
  factory Hotel.fromJson(String data) => Hotel.fromMap(jsonDecode(data));

  factory Hotel.fromFirestoreDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Hotel.fromMap(data);
  }

  Hotel cloneWith({
    String? name,
    String? description,
  }) {
    return Hotel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt,
    );
  }
}
