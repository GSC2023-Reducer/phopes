import 'package:isar/isar.dart';
import 'package:phopes/models/book_record.dart';

part 'book.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;
  String? title;
  String? author;
  String? thumbnail;
  int? numChapters;
  final bookRecord = IsarLink<BookRecord>();
}
