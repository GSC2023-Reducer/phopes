import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';

part 'book_record.g.dart';

@collection
class BookRecord {
  Id id = Isar.autoIncrement;
  final book = IsarLink<Book>();
  final currentChapter = IsarLink<BookChapterItem>();
  bool? isFinished;
  DateTime? startedAt;
  DateTime? lastReadAt;
  final readChapters = IsarLinks<BookChapterItem>();
}
