import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';

@collection
class BookChapters {
  Id? id;
  final book = IsarLink<Book>();
  final chapters = IsarLinks<BookChapter>();
}
