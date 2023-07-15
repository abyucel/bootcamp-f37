import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;

  UserData({
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

  factory UserData.fromMap(Map<String, dynamic> data) {
    return UserData(
      id: data["id"],
      firstName: data["first_name"],
      lastName: data["last_name"],
      email: data["email"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["created_at"]),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserData.fromJson(String data) => UserData.fromMap(jsonDecode(data));

  factory UserData.fromFirestoreDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserData.fromMap(data);
  }
}
