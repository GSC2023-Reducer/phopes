import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class User {
  final String userName;
  final String id;
  final String password;
  final DateTime createTime;

  User({required this.userName, required this.id, required this.password, required this.createTime});
  /*User.fromSnapshot(DataSnapshot snapshot) :
    id = snapshot.value['id'],
    name =  snapshot.value['name'],
    password = snapshot.value['password'],
    createTime = snapshot.value['creteTime'];*/
}

