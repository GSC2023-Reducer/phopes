import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';

part 'book_record.g.dart';

@collection
class BookRecord {
  Id id = Isar.autoIncrement;
  final book = IsarLink<Book>();
  var currentChapter = IsarLink<BookChapterItem>();
  bool? isFinished;
  DateTime? startedAt;
  DateTime? lastReadAt;
  var readChapters = IsarLinks<BookChapterItem>();
}
