import 'package:flutter/material.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'models/book.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:isar/isar.dart';

class BookViewPage extends StatefulWidget {
  final int tapChapterId;
  // book_detail_page에서 id를 가져올 예정

  const BookViewPage({
    super.key,
    required this.tapChapterId,
  });

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

// "bookChapter"에서 tapchapterid와 일치하는 "id"의 "bookChapter"를 불러온 다음에
// 1. "id" 2. "name" 3. "prev" 4. "next" 5. "content" 를 가져온다.
class _BookViewPageState extends State<BookViewPage> {
  late Isar isar;
  late BookChapterItem bookChapterItem;
  late BookRecord bookRecord;
  late DailyRecord dailyRecord;
  final ScrollController scrollControl = ScrollController();
  double recordProgress = 0;

  @override
  void initState() {
    super.initState();
    openIsar();

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
  void dispose() {
    closeIsar();
    super.dispose();
  }

  Future<void> openIsar() async {
    var isar = await Isar.open([BookChapterItemSchema]);
    var bookChapterItem =
        isar.collection<BookChapterItem>().getSync(widget.tapChapterId);
    isar = await Isar.open([BookRecordSchema]);
    final bookRecord =
        isar.collection<BookRecord>().getSync(1732420921406462071);
    isar = await Isar.open([DailyRecordSchema]);
    final dailyRecord =
        isar.collection<DailyRecord>().getSync(1016922496390167466);
  }

  void closeIsar() {
    isar.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 108 / 2,
        backgroundColor: Colors.white,
        title: Text(bookChapterItem.name!, // 불러온 "bookChapter"에 "name"을 넣는다
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
      body: Padding(
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
                    bookChapterItem.content!,
                    // 불러온 "bookChapter"에 "content"를 넣는다
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
                        //next는 id로 또 찾고 순환구조로 하면 된다.
                        // "bookChapter"의 "prev" 값을 사용해 그 값과 일치하는 bookChapter"의 id"를 tapchapterid로 정해서 초기에 있는 불러오는 과정을 다시 반복해서 적어둘 예정
                        setState(() {
                          // var bookChapterItem = isar.collection<BookChapterItem>().getSync();
                          recordProgress = 0;
                          // bookRecord.currentChapter = bookChapter.prev;
                          // 이 부분은 "bookRecord"의 "currentChapter" = "bookChapter"의 "prev"
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
                        borderRadius: BorderRadius.all(Radius.circular(22 / 2)),
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
                      onPressed: () {
                        if (recordProgress >= 0.8) {
                          () async {
                            // bookRecord = isar.BookChapter()
                            //     .where()
                            //     .bookIdEqualTo(bookChapter.id)
                            //     .findFirstSync();

                            // bookRecord.readChapters.add(bookChapter);
                            // bookRecord.currentChapter = bookChapter.id;

                            isar.writeTxn((isar) {
                              isar.bookRecords.put(bookRecord);
                            } as Future Function());

                            /*read 버튼을 누르면 넘겨줌
-> 있으면 daily reocord chaptersisRead에 추가해야한다
->  daily reocord에서 오늘 날짜 기준으로  record가 있는 지 찾고 없다면 객체를 하나 생성해야한다. (읽은 id를 추가해야한다) */
                            // 이 부분은 "bookRecord"의 "currentChapter" = "bookChapter"의 "id"로 변경 tapchapter일 필요 없음

                            // 이부분은 누르면 해당 챕터의 "id"를 "bookrecord"의 "readChapterId"에 등록
                          };
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text('80% 이상 읽었을 때 체크할 수 있습니다.'),
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
                        borderRadius: BorderRadius.all(Radius.circular(22 / 2)),
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
//next는 id로 또 찾고 순환구조로 하면 된다.
                        // bookChapter = isar.BookChapter()
                        //     .where()
                        //     .bookIdEqualTo(bookChapter.next)
                        //     .findFirstSync();
                        scrollControl.jumpTo(0);

                        setState(
                          () {
                            recordProgress = 0;
                            // bookRecord.currentChapter = bookChapter.next;
                            // bookChapter = bookChapter;
                          },
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22 / 2)),
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
