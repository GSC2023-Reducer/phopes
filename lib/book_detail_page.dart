import 'package:flutter/material.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'book_view_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:isar/isar.dart';
import 'models/book.dart';
import 'package:phopes/models/daily_record.dart';

class BookDetailPage extends StatefulWidget {
  int? bookId;

  BookDetailPage({
    super.key,
    // required this.bookId,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPage();
}

class _BookDetailPage extends State<BookDetailPage> {
  Book? book;
  BookChapters? bookChapters;
  BookRecord? bookRecord;
  bool isLoading = true;
  List<BookChapterItem> bookChaptersList = [];
  int chaptersLength = 0;

  void getData() async {
    Isar isar = await Isar.open(
      [
        BookSchema,
        BookChapterItemSchema,
        BookChaptersSchema,
        BookRecordSchema,
        DailyRecordSchema,
      ],
    );
    book = await isar.books
        .filter()
        .idEqualTo(widget.bookId)
        .findFirst()
        .then((value) => value);

    bookChapters =
        await isar.bookChapters.filter().idEqualTo(widget.bookId).findFirst();

    bookChaptersList = bookChapters!.chapters.toList();
    bookChaptersList.sort((a, b) => b.id.compareTo(a.id));

    bookRecord =
        await isar.bookRecords.filter().idEqualTo(widget.bookId).findFirst();

    chaptersLength = bookRecord!.readChapters.length;

    setState(() {
      isLoading = false;
    });
    isar.close();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // ignore: prefer_typing_uninitialized_variables
  var tapChapterId;

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
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
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
                                          image: NetworkImage(book!.thumbnail!),
                                          width: 328 / 2,
                                          height: 490 / 2,
                                          fit: BoxFit.fill,
                                        )),
                                    const SizedBox(height: 44 / 2),
                                    SizedBox(
                                      height: 70 / 2,
                                      child: Text(
                                        book!.title!,
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
                                        book!.author!,
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
                                      percent:
                                          (chaptersLength) / book!.numChapters!,
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
                                        children: bookChaptersList.map(
                                          (x) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    tapChapterId = x.id;
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
                                                      x.name!,
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
                                                    iconColor: ((bookRecord !=
                                                                null)
                                                            ? (bookRecord!
                                                                    .readChapters
                                                                    .map((chapter) =>
                                                                        chapter
                                                                            .id)
                                                                    .contains(
                                                                        x.id) ==
                                                                true)
                                                            : false)
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
                                    ),
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
                          "${(((bookRecord?.readChapters.length ?? 0) / book!.numChapters!) * 100).ceil()}%",
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
                      top: 1211 / 2,
                      right: 65 / 2,
                      child: SizedBox(
                        width: 619 / 2,
                        height: 98 / 2,
                        child: FloatingActionButton.extended(
                          extendedPadding: const EdgeInsets.fromLTRB(
                              23 / 2, 27 / 2, 22 / 2, 27 / 2),
                          elevation: 3,
                          backgroundColor: const Color(0xff2079FF),
                          label: ((bookRecord?.readChapters.length ?? 0) !=
                                  book!.numChapters!)
                              ? const Text(
                                  "이어 읽기",
                                  style: TextStyle(
                                    fontSize: 32 / 2,
                                    letterSpacing: -0.8 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Bold',
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              : const Text(
                                  "독서 완료",
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
              ),
      ),
    );
  }
}
