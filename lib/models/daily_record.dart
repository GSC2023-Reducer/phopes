import 'package:isar/isar.dart';
import 'package:phopes/models/book_chapter.dart';

part 'daily_record.g.dart';

@collection
class DailyRecord {
  Id id = Isar.autoIncrement;
  DateTime? createdAt;
  var chaptersRead = IsarLinks<BookChapterItem>();
}
