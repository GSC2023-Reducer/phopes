import '../models/chapter_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ChapterInfo {
  static getData(tapChapterId) async {
    String jsonString = await rootBundle
        .loadString('assets/littleprince/bookChapter/$tapChapterId.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return ChapterModel.fromJson(jsonData);
  }
}
