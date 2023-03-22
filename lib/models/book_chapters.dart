import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';

part 'book_chapters.g.dart';

@collection
class BookChapters {
  Id id = Isar.autoIncrement;
  final book = IsarLink<Book>();
  final chapters = IsarLinks<BookChapterItem>();
  final firstChapter = IsarLink<BookChapterItem>();
  final lastChapter = IsarLink<BookChapterItem>();
}
