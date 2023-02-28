import '../models/bookRecord_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookRecordInfo {
  static getData() async {
    String jsonString =
        await rootBundle.loadString('assets/littleprince/bookRecord.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return BookRecordModel.fromJson(jsonData);
  }
}
