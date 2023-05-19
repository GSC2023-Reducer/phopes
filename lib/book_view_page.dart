import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'package:phopes/provider/reading_progress_provider.dart';
import 'package:provider/provider.dart';
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
  Isar isar = IsarService().db!;
  Book? book;
  BookRecord? bookRecord;
  bool isLoading = true;
  List<BookChapterItem> bookChaptersList = [];
  DailyRecord? dailyRecord;
  BookChapterItem? bookChapterItem;
  int? prev;
  int? next;

  final ScrollController scrollControl = ScrollController();
  double recordProgress = 0;

  void getData(b, t) async {
    book = await isar.books.filter().idEqualTo(b).findFirst();

    bookChapterItem =
        await isar.bookChapterItems.filter().idEqualTo(t).findFirst();

    bookRecord = await isar.bookRecords.filter().idEqualTo(b).findFirst();

    if (bookChapterItem != null) {
      setState(() {
        isLoading = false;
      });
    }
    prev = bookChapterItem?.prev.value?.id;
    next = bookChapterItem?.next.value?.id;
  }

  @override
  void initState() {
    super.initState();
    getData(widget.bookId, widget.tapChapterId);

    scrollControl.addListener(() {
      /* 
      TODO: 준형
      텍스트가 너무 짧으면 스크롤이 활성화가 안 되어서 read를 누를 수가 없습니다.

      https://stackoverflow.com/questions/49307677/how-can-i-get-the-height-of-a-widget
      SingleChildScrollView와 Text의 길이 비율을 build할 때 계산해서 텍스트가 더 짧은 경우 
      read를 활성화하는 방향으로 코드를 짜는 건 어떨까하는 아이디어는 있습니다. 
      해당 아이디어 참고하거나 다른 방법으로 수정 부탁드립니다.
      */
      setState(() {
        double currentScrollProgress =
            (scrollControl.offset / scrollControl.position.maxScrollExtent);
        if (currentScrollProgress <= 1 &&
            currentScrollProgress > recordProgress) {
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
            ? const Text('Please Wait',
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
                      width: 65 / 2,
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
                              if (prev != null) {
                                scrollControl.jumpTo(0);

                                getData(widget.bookId, prev);
                                setState(() {
                                  recordProgress = 0;
                                  widget.tapChapterId = prev!;
                                });
                              }
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

                                var bookRecord = isar.bookRecords
                                    .filter()
                                    .book((q) => q.idEqualTo(widget.bookId))
                                    .findFirstSync()!;
                                if (bookRecord.startedAt == null) {
                                  bookRecord.startedAt = now;
                                  bookRecord.lastReadAt = now;
                                  bookRecord.currentChapter.value = isar
                                      .bookChapterItems
                                      .filter()
                                      .idEqualTo(widget.tapChapterId)
                                      .findFirstSync();
                                  bookRecord.readChapters.add(bookChapterItem!);

                                  await isar.writeTxn(() async {
                                    await isar.bookRecords.put(bookRecord);
                                    await bookRecord.currentChapter.save();
                                    await bookRecord.readChapters.save();
                                  });
                                } else {
                                  var tapChapterBookItem = isar.bookChapterItems
                                      .filter()
                                      .idEqualTo(widget.tapChapterId)
                                      .findFirstSync();

                                  bookRecord.readChapters
                                      .add(tapChapterBookItem!);

                                  bookRecord.currentChapter.value =
                                      tapChapterBookItem;

                                  await isar.writeTxn(() async {
                                    await bookRecord.readChapters.save();
                                    await bookRecord.currentChapter.save();
                                  });
                                }
                                final myState =
                                    Provider.of<ReadingProgressProvider>(
                                        context,
                                        listen: false);
                                myState.refresReadingProgress(widget.bookId);
                              } else {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text('Read more than 80%'),
                                      actions: [
                                        TextButton(
                                          child: const Text('Confirm'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              setState(() {});
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
                              if (next != null) {
                                scrollControl.jumpTo(0);
                                getData(widget.bookId, next);
                                setState(
                                  () {
                                    widget.tapChapterId = next!;
                                    recordProgress = 0;
                                  },
                                );
                              }
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
