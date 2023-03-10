import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';

part 'book_chapter.g.dart';

@collection
class BookChapterItem {
  Id id = Isar.autoIncrement;
  final book = IsarLink<Book>();
  String? name;
  final prev = IsarLink<BookChapterItem>();
  final next = IsarLink<BookChapterItem>();
  String? content;
}
