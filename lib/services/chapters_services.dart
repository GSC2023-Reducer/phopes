import '../models/chapters_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ChaptersInfo {
  static getData() async {
    String jsonString =
        await rootBundle.loadString('assets/littleprince/bookChapters.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return ChaptersModel.fromJson(jsonData);
  }
}
