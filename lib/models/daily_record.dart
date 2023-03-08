import 'package:isar/isar.dart';
import 'package:phopes/models/book_chapter.dart';

@collection
class BookRecord {
  Id? id;
  DateTime? createdAt;
  final chaptersRead = IsarLinks<BookChapter>();
}
