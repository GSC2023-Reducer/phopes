import 'package:flutter/material.dart';
import 'package:phopes/book_view_page.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:isar/isar.dart';
import 'models/book.dart';

class BookDetailPage extends StatefulWidget {
  final int bookId;

  const BookDetailPage(
    this.bookId, {
    super.key,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPage();
}

class _BookDetailPage extends State<BookDetailPage> {
  Isar isar = IsarService().db!;
  late Future<Book?> book;
  late BookChapters? bookChapters;
  late Future<BookRecord?> bookRecord;
  late List chaptersOrder = [];
  late List<BookChapterItem> finishedChapters = [];
  late List finishedChaptersIds = [];
  int finishedChaptersCount = 0;
  late int tapChapterId;

  @override
  void initState() {
    // TODO: 준형 Provider로 상태관리
    super.initState();
    book = isar.books.filter().idEqualTo(widget.bookId).findFirst();
    bookChapters = isar.bookChapters
        .filter()
        .book((q) => q.idEqualTo(widget.bookId))
        .findFirstSync();

    if (isar.bookRecords
        .filter()
        .book((q) => q.idEqualTo(widget.bookId))
        .isNotEmptySync()) {
      finishedChapters = isar.bookRecords
          .filter()
          .book((q) => q.idEqualTo(widget.bookId))
          .findFirstSync()!
          .readChapters
          .toList();

      for (var element in finishedChapters) {
        finishedChaptersIds.add(element.id);
      }

      finishedChaptersCount = finishedChapters.length;
    }

    var chapter = bookChapters!.firstChapter;
    chaptersOrder.add(chapter.value!.id);
    while (chapter.value!.next.value != null) {
      chapter = chapter.value!.next;
      chaptersOrder.add(chapter.value!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 108 / 2,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: FutureBuilder(
          future: book,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(48 / 2, 0, 48 / 2, 10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 654 / 2,
                              height: 1426 / 2,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  127, 158, 158, 158),
                                              blurRadius: 6.0,
                                              spreadRadius: 0.5,
                                              offset: Offset(10 / 2, 10 / 2),
                                            ),
                                          ],
                                        ),
                                        child: Image(
                                          image: NetworkImage(
                                              snapshot.data!.thumbnail!),
                                          width: 328 / 2,
                                          height: 490 / 2,
                                          fit: BoxFit.fill,
                                        )),
                                    const SizedBox(height: 44 / 2),
                                    SizedBox(
                                      height: 70 / 2,
                                      child: Text(
                                        snapshot.data!.title!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            letterSpacing: -1.2 / 2,
                                            fontSize: 48 / 2,
                                            fontFamily:
                                                'Noto Sans CJK KR, Medium',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(height: 28 / 2),
                                    SizedBox(
                                      height: 40 / 2,
                                      child: Text(
                                        snapshot.data!.author!,
                                        style: const TextStyle(
                                            color: Color(0xff767676),
                                            fontSize: 28 / 2,
                                            letterSpacing: 0,
                                            fontFamily:
                                                'Noto Sans CJK KR, Medium',
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(height: 32 / 2),
                                    LinearPercentIndicator(
                                      width: 654 / 2,
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 14 / 2,
                                      percent: (finishedChaptersCount) /
                                          snapshot.data!.numChapters!,
                                      progressColor: const Color(0xff2079FF),
                                      backgroundColor: const Color(0xffF1F1F5),
                                    ),
                                    const SizedBox(height: 44 / 2),
                                    Container(
                                      height: 2 / 2,
                                      color: const Color(0xffDBDBDB),
                                    ),
                                    SizedBox(
                                      width: 654 / 2,
                                      height: 662 / 2,
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        children: chaptersOrder.map(
                                          (id) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    tapChapterId = id;
                                                  },
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BookViewPage(
                                                      tapChapterId:
                                                          tapChapterId,
                                                      bookId: widget.bookId,
                                                    ),
                                                    fullscreenDialog: true,
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    title: Text(
                                                      bookChapters!.chapters
                                                          .firstWhere(
                                                              (element) =>
                                                                  element.id ==
                                                                  id)
                                                          .name!,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff767676),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            'Noto Sans CJK KR, Medium',
                                                      ),
                                                    ),
                                                    leading:
                                                        const Icon(Icons.book),
                                                    trailing: const Icon(
                                                        Icons.check_circle),
                                                    iconColor:
                                                        finishedChaptersIds
                                                                .contains(id)
                                                            ? const Color(
                                                                0xff2079FF)
                                                            : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2 / 2,
                                                    color:
                                                        const Color(0xffDBDBDB),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 658 / 2,
                      right: 47 / 2,
                      child: SizedBox(
                        width: 60 / 2,
                        height: 35 / 2,
                        child: Text(
                          "${((finishedChaptersCount / snapshot.data!.numChapters!) * 100).ceil()}%",
                          style: const TextStyle(
                              fontSize: 24 / 2,
                              color: Color(0xff767676),
                              letterSpacing: -0.6 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60 / 2,
                      right: 35 / 2,
                      child: SizedBox(
                        width: 619 / 2,
                        height: 98 / 2,
                        child: FloatingActionButton.extended(
                          extendedPadding: const EdgeInsets.fromLTRB(
                              23 / 2, 27 / 2, 22 / 2, 27 / 2),
                          elevation: 3,
                          backgroundColor: const Color(0xff2079FF),
                          label: ((snapshot.data!.bookRecord.value != null
                                      ? snapshot.data!.bookRecord.value!
                                          .readChapters.length
                                      : 0) !=
                                  snapshot.data!.numChapters!)
                              ? const Text(
                                  "Continue Reading",
                                  style: TextStyle(
                                    fontSize: 32 / 2,
                                    letterSpacing: -0.8 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Bold',
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              : const Text(
                                  "Finished reading",
                                  style: TextStyle(
                                    fontSize: 32 / 2,
                                    letterSpacing: -0.8 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Bold',
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                          onPressed: () async {
                            /*80퍼센트 달성시 (변화 없고)
                              버튼 활성화 해서
                              누르면 isfinishied를 바꾼다
                             */
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(22 / 2)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
}
