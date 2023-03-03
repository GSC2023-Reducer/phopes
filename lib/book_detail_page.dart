import 'dart:async';

import 'package:phopes/models/book_model.dart';
import 'package:phopes/models/chapters_model.dart';
import 'package:phopes/services/chapters_services.dart';
import 'services/book_services.dart';
import 'package:flutter/material.dart';
import 'book_view_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BookDetailPage extends StatefulWidget {
  // final String bookId = '3bqdJxSYWZ25UNiN6pT0';
  // 어떤 책을 가져올 것인지 구분하는 것을 생각해야한다.

  const BookDetailPage({
    super.key,
    // required this.bookId,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPage();
}

class _BookDetailPage extends State<BookDetailPage> {
  BookModel bookInfo = BookModel(
    title: '',
    thumbnail: '',
    isRead: false,
    numChapters: 0,
    id: '',
    author: '',
  );

  ChaptersModel chaptersInfo = ChaptersModel(
    chapters: [],
    isRead: false,
    id: '',
    bookId: '',
  );

  void waitForData() async {
    bookInfo = await BookInfo.getData();
    chaptersInfo = await ChaptersInfo.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForData();
  }

  void tapCheckButtonChangeIsRead(String chapterId, bool tapIsRead) {
    chaptersInfo.chapters
        .where((x) => x.bookChapterId == chapterId)
        .map((x) => {
              x.isRead = tapIsRead,
            });
    setState(() {});
  }

  var tapChapterId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xff191919)),
        title: Text(
          '${bookInfo.title} 상세 페이지',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40 / 2,
            letterSpacing: -1.0,
            fontWeight: FontWeight.w200,
            fontFamily: 'Noto Sans CJK KR, Medium',
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 25 / 2, 48 / 2, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 654 / 2,
                  height: 648 / 2,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                image: AssetImage(bookInfo.thumbnail),
                                width: 654 / 2,
                                height: 400 / 2,
                                fit: BoxFit.fill),
                          ),
                          const SizedBox(height: 24 / 2),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              bookInfo.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -0.6,
                                  fontSize: 48 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              bookInfo.author,
                              style: const TextStyle(
                                  color: Color(0xff767676),
                                  fontSize: 24 / 2,
                                  letterSpacing: -0.6,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          const SizedBox(height: 24 / 2),
                          LinearPercentIndicator(
                            width: 654 / 2,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 36 / 2,
                            percent: chaptersInfo.chapters
                                    .where((x) => x.isRead == true)
                                    .length /
                                bookInfo.numChapters,
                            center: Text(
                              "${((chaptersInfo.chapters.where((x) => x.isRead == true).length / bookInfo.numChapters) * 100).toStringAsFixed(2)}%",
                              style: const TextStyle(
                                  fontSize: 35 / 2,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w100),
                            ),
                            barRadius: const Radius.circular(16),
                            progressColor: const Color(0xff2079FF),
                            backgroundColor: const Color(0xffF1F1F5),
                          )
                        ]),
                  )),
              const SizedBox(height: 40 / 2),
              SizedBox(
                width: 654 / 2,
                height: 720 / 2,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: chaptersInfo.chapters.map(
                    (x) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tapChapterId = x.bookChapterId;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookViewPage(
                                tapChapterId: tapChapterId,
                                //  tapCheck: tapCheckButtonChangeIsRead,
                              ),
                              fullscreenDialog: true,
                            ),
                          ).then((String chapterId, bool tapIsRead) {
                            setState(() {
                              tapCheckButtonChangeIsRead(chapterId, tapIsRead);
                            });
                          } as FutureOr Function(dynamic value));
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            '${x.name}',
                            style: const TextStyle(
                              color: Color(0xff767676),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                            ),
                          ),
                          leading: const Icon(Icons.book),
                          trailing: const Icon(Icons.check_circle),
                          iconColor: (x.isRead == true)
                              ? const Color.fromARGB(255, 50, 47, 255)
                              : null,
                          // 논리 수정 필요
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
    );
  }
}
