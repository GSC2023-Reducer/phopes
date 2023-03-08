import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';

@collection
class BookChapter {
  Id? id;
  final book = IsarLink<Book>();
  String? name;
  final prev = IsarLink<BookChapter>();
  final next = IsarLink<BookChapter>();
  String? content;
}
