import 'package:flutter/material.dart';

class Class{
  String className;
  bool finish;
  DateTime recentTime;
  String imagePath;
  double progress;
  DateTime startTime;

  Class({required this.className, required this.finish, required this.recentTime, required this.imagePath, required this.progress,
   required this.startTime});
}