import 'package:flutter/material.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'models/book.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:isar/isar.dart';

class BookViewPage extends StatefulWidget {
  int tapChapterId;
  final int bookId;

  BookViewPage({
    super.key,
    required this.tapChapterId,
    required this.bookId,
  });

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  Book? book;
  BookRecord? bookRecord;
  bool isLoading = true;
  List<BookChapterItem> bookChaptersList = [];
  DailyRecord? dailyRecord;
  BookChapterItem? bookChapterItem;
  int prev = 0;
  int next = 0;

  final ScrollController scrollControl = ScrollController();
  double recordProgress = 0;

  void getData(b, t) async {
    Isar isar = await Isar.open(
      [
        BookSchema,
        BookChapterItemSchema,
        BookChaptersSchema,
        BookRecordSchema,
        DailyRecordSchema,
      ],
    );
    book = await isar.books.filter().idEqualTo(b).findFirst();

    bookChapterItem =
        await isar.bookChapterItems.filter().idEqualTo(t).findFirst();

    bookRecord = await isar.bookRecords.filter().idEqualTo(b).findFirst();

    if (bookChapterItem != null) {
      setState(() {
        isLoading = false;
      });
    }
    prev = bookChapterItem?.prev.value?.id ?? 1;
    next = bookChapterItem?.next.value?.id ?? book!.numChapters!;

    await isar.close();
  }

  @override
  void initState() {
    super.initState();
    getData(widget.bookId, widget.tapChapterId);

    scrollControl.addListener(() {
      setState(() {
        double currentScrollProgress =
            (scrollControl.offset / scrollControl.position.maxScrollExtent);
        if (currentScrollProgress > recordProgress) {
          recordProgress = currentScrollProgress;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 108 / 2,
        backgroundColor: Colors.white,
        title: (bookChapterItem == null)
            ? const Text('잠시만 기다려 주세요.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36 / 2,
                  letterSpacing: -0.9,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Noto Sans CJK KR, Medium',
                ))
            : Text(bookChapterItem!.name!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 36 / 2,
                  letterSpacing: -0.9,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Noto Sans CJK KR, Medium',
                )),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 56 / 2,
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(48 / 2, 35 / 2, 48 / 2, 0),
              child: Center(
                widthFactor: 654 / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 1100 / 2,
                      width: 654 / 2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollControl,
                        child: Text(
                          bookChapterItem!.content!,
                          style: const TextStyle(
                            color: Color(0xff191919),
                            fontSize: 28 / 2,
                            letterSpacing: -0.7 / 2,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Noto Sans CJK KR, Medium',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 34 / 2),
                    SizedBox(
                      height: 36 / 2,
                      width: 60 / 2,
                      child: Text(
                        "${(recordProgress * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
                            wordSpacing: -0.6 / 2,
                            fontSize: 24 / 2,
                            color: Color(0xff767676),
                            fontFamily: 'Noto Sans CJK KR, Medium',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 15 / 2),
                    LinearPercentIndicator(
                      lineHeight: 14 / 2,
                      percent: recordProgress,
                      progressColor: const Color(0xff2079FF),
                      backgroundColor: const Color(0xffF1F1F5),
                    ),
                    const SizedBox(height: 38 / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 68 / 2,
                          width: 170 / 2,
                          child: FloatingActionButton.extended(
                            elevation: 3,
                            extendedPadding: const EdgeInsets.fromLTRB(
                                16 / 2, 15 / 2, 52 / 2, 13 / 2),
                            heroTag: 'prev',
                            backgroundColor: const Color(0xffF1F1F5),
                            icon: const Icon(
                              Icons.navigate_before,
                              color: Colors.black38,
                            ),
                            onPressed: () {
                              scrollControl.jumpTo(0);

                              getData(widget.bookId, prev);
                              setState(() {
                                recordProgress = 0;
                                widget.tapChapterId = prev;
                              });
                            },
                            label: const Text(
                              'Prev',
                              style: TextStyle(
                                fontSize: 27 / 2,
                                letterSpacing: -0.68 / 2,
                                fontFamily: 'Noto Sans CJK KR, Medium',
                                color: Color(0xff767676),
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22 / 2)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 68 / 2,
                          width: 170 / 2,
                          child: FloatingActionButton.extended(
                            elevation: 3,
                            extendedPadding: const EdgeInsets.fromLTRB(
                                42 / 2, 15 / 2, 42 / 2, 13 / 2),
                            heroTag: 'check',
                            icon: Icon(
                              Icons.check,
                              size: 40 / 2,
                              color: (recordProgress > 0.8)
                                  ? Colors.white
                                  : const Color(0xff767676),
                            ),
                            backgroundColor: (recordProgress > 0.8)
                                ? const Color(0xff2079FF)
                                : const Color(0xffF1F1F5),
                            onPressed: () async {
                              if (recordProgress >= 0.8) {
                                // daily record와 book record를 조건에 맞게 생성해주고
                                // 각 record에 bookchapteritem을 넣어주는 코드입니다.
                                // 코드를 돌려보니 read 버튼을 누른 챕터를 가져오고, 각각의 record를 코드 내에서 생성하는 것은 되지만
                                // record 안에 챕터를 넣는 과정과 코드 내에서 생성한 record를 isar에 넣는 과정이 안되고 있습니다.
                                Isar isar = await Isar.open(
                                  [
                                    BookSchema,
                                    BookChapterItemSchema,
                                    BookChaptersSchema,
                                    BookRecordSchema,
                                    DailyRecordSchema,
                                  ],
                                );
                                DateTime now = DateTime.now();
                                now = DateTime(now.year, now.month, now.day);
                                if (isar.dailyRecords
                                    .filter()
                                    .createdAtEqualTo(now)
                                    .isEmptySync()) {
                                  var addDailyRecords = DailyRecord()
                                    ..createdAt = now
                                    ..chaptersRead =
                                        IsarLinks<BookChapterItem>();

                                  isar.writeTxnSync(() async {
                                    isar.dailyRecords.putSync(addDailyRecords);
                                  });
                                }

                                if (isar.dailyRecords
                                    .filter()
                                    .chaptersRead(
                                        (e) => e.idEqualTo(widget.tapChapterId))
                                    .isEmptySync()) {
                                  var addDailyRecord = isar.dailyRecords
                                      .filter()
                                      .createdAtEqualTo(now)
                                      .findFirstSync();

                                  var tapChapterBookItem = isar.bookChapterItems
                                      .filter()
                                      .idEqualTo(widget.tapChapterId)
                                      .findFirstSync();

                                  addDailyRecord!.chaptersRead
                                      .add(tapChapterBookItem!);

                                  await isar.writeTxn(() async {
                                    await addDailyRecord.chaptersRead.save();
                                  });
                                }
                                if (isar.bookRecords
                                    .filter()
                                    .idEqualTo(widget.bookId)
                                    .readChapters(
                                        (q) => q.idEqualTo(widget.tapChapterId))
                                    .isEmptySync()) {
                                  var bookRecord = BookRecord()
                                    ..book.value = isar.books
                                        .filter()
                                        .idEqualTo(widget.bookId)
                                        .findFirstSync()
                                    ..currentChapter.value = isar
                                        .bookChapterItems
                                        .filter()
                                        .idEqualTo(widget.tapChapterId)
                                        .findFirstSync()
                                    ..isFinished = false
                                    ..startedAt = now
                                    ..lastReadAt = null
                                    ..readChapters.add(bookChapterItem!);
                                  // 여기서 bookchapteritem이 안들어갑니다.

                                  await isar.writeTxn(() async {
                                    await isar.bookRecords.put(bookRecord);
                                  });
                                } else {
                                  var addBookRecord = isar.bookRecords
                                      .filter()
                                      .idEqualTo(widget.bookId)
                                      .findFirstSync();

                                  var tapChapterBookItem = isar.bookChapterItems
                                      .filter()
                                      .idEqualTo(widget.tapChapterId)
                                      .findFirstSync();

                                  addBookRecord!.readChapters
                                      .add(tapChapterBookItem!);

                                  addBookRecord.currentChapter.value =
                                      tapChapterBookItem;

                                  await isar.writeTxn(() async {
                                    await addBookRecord.readChapters.save();
                                    await addBookRecord.currentChapter.save();
                                  });
                                }

                                isar.close();
                                // 코드 구분 주석
                              } else {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text(
                                          '80% 이상 읽었을 때 체크할 수 있습니다.'),
                                      actions: [
                                        TextButton(
                                          child: const Text('확인'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            label: Text(
                              'Read',
                              style: TextStyle(
                                color: (recordProgress > 0.8)
                                    ? Colors.white
                                    : const Color(0xff767676),
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22 / 2)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 68 / 2,
                          width: 170 / 2,
                          child: FloatingActionButton.extended(
                            elevation: 3,
                            extendedPadding: const EdgeInsets.fromLTRB(
                                42 / 2, 15 / 2, 16 / 2, 13 / 2),
                            backgroundColor: const Color(0xffF1F1F5),
                            heroTag: 'next',
                            label: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 27 / 2,
                                    letterSpacing: -0.68 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    color: Color(0xff767676),
                                  ),
                                ),
                                const Icon(
                                  Icons.navigate_next,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            icon: Container(),
                            onPressed: () async {
                              scrollControl.jumpTo(0);
                              getData(widget.bookId, next);
                              setState(
                                () {
                                  widget.tapChapterId = next;
                                  recordProgress = 0;
                                },
                              );
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22 / 2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
