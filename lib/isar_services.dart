import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'package:phopes/models/firebase/book_model.firebase.dart';
import 'package:phopes/models/firebase/chapter_model.firebase.dart';

class IsarService {
  late Isar? db;
  IsarService() {
    db = Isar.getInstance();
    db ??= openDB();
  }

  Isar openDB() {
    return Isar.openSync(
      [
        BookSchema,
        BookChapterItemSchema,
        BookChaptersSchema,
        BookRecordSchema,
        DailyRecordSchema,
      ],
      inspector: true,
    );
  }

  Future<void> saveBook(BookFirebase bookFirebase,
      List<ChapterFirebase> bookChaptersFirebase) async {
    final isar = db;

    var book = Book()
      ..id = int.parse(bookFirebase.id)
      ..thumbnail = bookFirebase.thumbnail
      ..title = bookFirebase.title
      ..author = bookFirebase.author
      ..numChapters = bookFirebase.numChapters;

    bookChaptersFirebase.sort((a, b) => int.parse(a.id) - int.parse(b.id));
    List<BookChapterItem> bookChapterItems = [];
    for (var bookChapter in bookChaptersFirebase) {
      var bookChapterItem = BookChapterItem()
        ..id = int.parse(bookChapter.id)
        ..book.value = book
        ..name = bookChapter.name
        ..content = bookChapter.content;
      bookChapterItems.add(bookChapterItem);
    }

    for (var i = 0; i < bookChapterItems.length; i++) {
      if (i == 0) {
        bookChapterItems[i].prev.value = null;
        bookChapterItems[i].next.value = bookChapterItems[i + 1];
      } else if (i == bookChapterItems.length - 1) {
        bookChapterItems[i].prev.value = bookChapterItems[i - 1];
        bookChapterItems[i].next.value = null;
      } else {
        bookChapterItems[i].prev.value = bookChapterItems[i - 1];
        bookChapterItems[i].next.value = bookChapterItems[i + 1];
      }
    }

    var bookChapters = BookChapters()
      ..book.value = book
      ..firstChapter.value = bookChapterItems.first
      ..lastChapter.value = bookChapterItems.last;

    var bookRecord = BookRecord()
      ..book.value = book
      ..isFinished = false;
    book.bookRecord.value = bookRecord;

    bookChapters.chapters.addAll(bookChapterItems);

    await isar!.writeTxn(() async {
      await isar.bookChapters.put(bookChapters);
      await isar.books.put(book);
      await isar.bookRecords.put(bookRecord);
      await isar.bookChapterItems.putAll(bookChapterItems);
      await bookChapters.firstChapter.save();
      await bookChapters.lastChapter.save();
      await bookChapters.chapters.save();
      await bookChapters.book.save();
      await bookRecord.book.save();
      await book.bookRecord.save();

      for (var i = 0; i < bookChapterItems.length; i++) {
        if (i != 0) {
          await bookChapterItems[i].prev.save();
        }
        if (i != bookChapterItems.length - 1) {
          await bookChapterItems[i].next.save();
        }
        await bookChapterItems[i].book.save();
      }
    });
  }

  //Finished bookRecord리스트 반환
  Future<List<BookRecord>> finishedBooks() async {
    final isar = db!;
    final finishedBooks =
        isar.bookRecords.filter().isFinishedEqualTo(true).findAll();
    return finishedBooks;
  }

  //lastReadAt 기준 book내림차순 정렬된 리스트 반환
  Future<List<BookRecord>> sortBookRecords() async {
    final isar = db!;
    final sortedBookRecords =
        isar.bookRecords.where().sortByLastReadAtDesc().findAll();
    return sortedBookRecords;
  }

  Future<List<Book>> getBooks() async {
    final isar = db!;
    final books = isar.books.where().sortByTitle().findAll();
    return books;
  }

  Future<List<Book>> getSortedBooks() async {
    final isar = db!;
    final books = await isar.books.where().sortByTitle().findAll();
    books.sort((a, b) {
      if (a.bookRecord.value!.lastReadAt != null &&
          b.bookRecord.value!.lastReadAt != null) {
        return b.bookRecord.value!.lastReadAt!
            .compareTo(a.bookRecord.value!.lastReadAt!);
      } else {
        return 1;
      }
    });

    return Future(() => books);
  }

  getDailyRecords() {
    final isar = db!;
    final dailyRecords = isar.dailyRecords.where().findAll();
    return dailyRecords;
  }

  //기타 필요한 함수들 넣을 예정
}
