import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_record.dart';

import '../isar_services.dart';

class ReadingProgressProvider with ChangeNotifier {
  Isar isar = IsarService().db!;
  late List _finishedChapters = [];
  late List _finishedChaptersIds = [];

  // getter method
  int get getInt => _finishedChapters.length;
  List get getList => _finishedChaptersIds;

  Future<void> refresReadingProgress(int id) async {
    List<dynamic> finishedChapters = await isar.bookRecords
        .filter()
        .book((q) => q.idEqualTo(id))
        .findFirstSync()!
        .readChapters
        .toList();
    for (var element in finishedChapters) {
      _finishedChaptersIds.add(element.id);
    }
    _finishedChapters = finishedChapters;
    notifyListeners();
  }
}
