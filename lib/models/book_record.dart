import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';

@collection
class BookRecord {
  Id? id;
  final book = IsarLink<Book>();
  final currentChapter = IsarLink<BookChapter>();
  bool? isFinished;
  DateTime? startedAt;
  DateTime? lastReadAt;
  final readChapters = IsarLinks<BookChapter>();
}
