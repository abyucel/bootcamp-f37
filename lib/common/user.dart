import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "created_at": createdAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      firstName: data["first_name"],
      lastName: data["last_name"],
      email: data["email"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["created_at"]),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String data) => User.fromMap(jsonDecode(data));

  factory User.fromFirestoreDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User.fromMap(data);
  }

  User cloneWith({
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email,
      createdAt: createdAt,
    );
  }
}
