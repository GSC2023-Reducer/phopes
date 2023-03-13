import 'package:isar/isar.dart';
import 'package:phopes/data/raw_content.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';

Future<void> loadBooks() async {
  final isar = await Isar.open(
    [
      BookSchema,
      BookChapterItemSchema,
      BookChaptersSchema,
      BookRecordSchema,
      DailyRecordSchema,
    ],
  );

  var book = Book()
    ..author = '앙투안 드 생텍쥐페리'
    ..title = '어린왕자'
    ..numChapters = 27
    ..thumbnail =
        'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791187192596.jpg';

  var contents = RawContent();

  var ch27 = BookChapterItem()
    ..name = '27'
    ..book.value = book
    ..content = contents.ch27;
  var ch26 = BookChapterItem()
    ..name = '26'
    ..book.value = book
    ..content = contents.ch26;
  var ch25 = BookChapterItem()
    ..name = '25'
    ..book.value = book
    ..content = contents.ch25;
  var ch24 = BookChapterItem()
    ..name = '24'
    ..book.value = book
    ..content = contents.ch24;
  var ch23 = BookChapterItem()
    ..name = '23'
    ..book.value = book
    ..content = contents.ch23;
  var ch22 = BookChapterItem()
    ..name = '22'
    ..book.value = book
    ..content = contents.ch22;
  var ch21 = BookChapterItem()
    ..name = '21'
    ..book.value = book
    ..content = contents.ch21;
  var ch20 = BookChapterItem()
    ..name = '20'
    ..book.value = book
    ..content = contents.ch20;
  var ch19 = BookChapterItem()
    ..name = '19'
    ..book.value = book
    ..content = contents.ch19;
  var ch18 = BookChapterItem()
    ..name = '18'
    ..book.value = book
    ..content = contents.ch18;
  var ch17 = BookChapterItem()
    ..name = '17'
    ..book.value = book
    ..content = contents.ch17;
  var ch16 = BookChapterItem()
    ..name = '16'
    ..book.value = book
    ..content = contents.ch16;
  var ch15 = BookChapterItem()
    ..name = '15'
    ..book.value = book
    ..content = contents.ch15;
  var ch14 = BookChapterItem()
    ..name = '14'
    ..book.value = book
    ..content = contents.ch14;
  var ch13 = BookChapterItem()
    ..name = '13'
    ..book.value = book
    ..content = contents.ch13;
  var ch12 = BookChapterItem()
    ..name = '12'
    ..book.value = book
    ..content = contents.ch12;
  var ch11 = BookChapterItem()
    ..name = '11'
    ..book.value = book
    ..content = contents.ch11;
  var ch10 = BookChapterItem()
    ..name = '10'
    ..book.value = book
    ..content = contents.ch10;
  var ch09 = BookChapterItem()
    ..name = '9'
    ..book.value = book
    ..content = contents.ch09;
  var ch08 = BookChapterItem()
    ..name = '8'
    ..book.value = book
    ..content = contents.ch08;
  var ch07 = BookChapterItem()
    ..name = '7'
    ..book.value = book
    ..content = contents.ch07;
  var ch06 = BookChapterItem()
    ..name = '6'
    ..book.value = book
    ..content = contents.ch06;
  var ch05 = BookChapterItem()
    ..name = '5'
    ..book.value = book
    ..content = contents.ch05;
  var ch04 = BookChapterItem()
    ..name = '4'
    ..book.value = book
    ..content = contents.ch04;
  var ch03 = BookChapterItem()
    ..name = '3'
    ..book.value = book
    ..content = contents.ch03;
  var ch02 = BookChapterItem()
    ..name = '2'
    ..book.value = book
    ..content = contents.ch02;
  var ch01 = BookChapterItem()
    ..name = '1'
    ..book.value = book
    ..content = contents.ch01;

  ch27.prev.value = ch26;
  ch26.prev.value = ch25..next.value = ch27;
  ch25.prev.value = ch24..next.value = ch26;
  ch24.prev.value = ch23..next.value = ch25;
  ch23.prev.value = ch22..next.value = ch24;
  ch22.prev.value = ch21..next.value = ch23;
  ch21.prev.value = ch20..next.value = ch22;
  ch20.prev.value = ch19..next.value = ch21;
  ch19.prev.value = ch18..next.value = ch20;
  ch18.prev.value = ch17..next.value = ch19;
  ch17.prev.value = ch16..next.value = ch18;
  ch16.prev.value = ch15..next.value = ch17;
  ch15.prev.value = ch14..next.value = ch16;
  ch14.prev.value = ch13..next.value = ch15;
  ch13.prev.value = ch12..next.value = ch14;
  ch12.prev.value = ch11..next.value = ch13;
  ch11.prev.value = ch10..next.value = ch12;
  ch10.prev.value = ch09..next.value = ch11;
  ch09.prev.value = ch08..next.value = ch10;
  ch08.prev.value = ch07..next.value = ch09;
  ch07.prev.value = ch06..next.value = ch08;
  ch06.prev.value = ch05..next.value = ch07;
  ch05.prev.value = ch04..next.value = ch06;
  ch04.prev.value = ch03..next.value = ch05;
  ch03.prev.value = ch02..next.value = ch04;
  ch02.prev.value = ch01..next.value = ch03;
  ch01.next.value = ch02;

  var bookChapters = BookChapters()..book.value = book;

  bookChapters.chapters.addAll({
    ch27,
    ch26,
    ch25,
    ch24,
    ch23,
    ch22,
    ch21,
    ch20,
    ch19,
    ch18,
    ch17,
    ch16,
    ch15,
    ch14,
    ch13,
    ch12,
    ch11,
    ch10,
    ch09,
    ch08,
    ch07,
    ch06,
    ch05,
    ch04,
    ch03,
    ch02,
    ch01,
  });
  isar.writeTxnSync(() async {
    isar.books.putSync(book);
    isar.bookChapterItems.putAllSync([
      ch27,
      ch26,
      ch25,
      ch24,
      ch23,
      ch22,
      ch21,
      ch20,
      ch19,
      ch18,
      ch17,
      ch16,
      ch15,
      ch14,
      ch13,
      ch12,
      ch11,
      ch10,
      ch09,
      ch08,
      ch07,
      ch06,
      ch05,
      ch04,
      ch03,
      ch02,
      ch01,
    ]);
    isar.bookChapters.putSync(bookChapters);
  });
  isar.close();
}
