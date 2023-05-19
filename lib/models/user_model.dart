import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // primary key
  final String email;
  final String username;
  final DateTime joinedAt;

  const User({
    required this.email,
    required this.username,
    required this.joinedAt,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        'joinedAt': joinedAt,
      };
}
