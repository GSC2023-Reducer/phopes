import '../models/book_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookInfo {
  static getData() async {
    String jsonString =
        await rootBundle.loadString('assets/littleprince/book.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return BookModel.fromJson(jsonData);
  }
}
