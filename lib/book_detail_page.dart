import 'package:phopes/models/book_model.dart';
import 'package:phopes/models/chapters_model.dart';
import 'package:phopes/services/chapters_services.dart';
import 'services/book_services.dart';
import 'package:flutter/material.dart';
import 'book_view_page.dart';

class BookDetailPage extends StatefulWidget {
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

  var tapChapterTitle = '목차를 선택하세요';
  var tapChapterId = '';

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments
        as String; //넘어온 arguments(id)저장
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
          bookInfo.title,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookViewPage(
                                      tapChapterTitle: tapChapterTitle,
                                      tapChapterId: tapChapterId,
                                      isRead: true,
                                    ),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: Image(
                                  image: AssetImage(bookInfo.thumbnail),
                                  width: 654 / 2,
                                  height: 400 / 2,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(height: 24 / 2),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              tapChapterTitle,
                              style: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -0.6,
                                  fontSize: 48 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 24 / 2),
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
                        onLongPress: () {
                          setState(
                            () {
                              tapChapterTitle = x.name;
                              tapChapterId = x.bookChapterId;
                            },
                          );
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
