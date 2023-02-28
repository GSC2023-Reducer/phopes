import 'package:flutter/material.dart';
import 'services/chapter_services.dart';
import 'models/chapter_model.dart';

class BookViewPage extends StatefulWidget {
  String tapChapterTitle, tapChapterId;
  var isRead;

  BookViewPage({
    super.key,
    required this.tapChapterTitle,
    required this.tapChapterId,
    required this.isRead,
  });

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  ChapterModel chapterInfo = ChapterModel(
    id: '',
    name: '',
    isRead: false,
    prev: '',
    next: '',
    content: '',
  );

  void waitForData() async {
    chapterInfo = await ChapterInfo.getData(widget.tapChapterId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForData();
  }

  // 버튼을 누르면 다음 또는 이전 페이지로 이동하는 것을 tapChpaterID = prev or next로 해서 waitForData 상태를 새로 변경하기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.tapChapterTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 40 / 2,
              letterSpacing: -1.0,
              fontWeight: FontWeight.w200,
              fontFamily: 'Noto Sans CJK KR, Medium',
            )),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          weight: 700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 25 / 2, 48 / 2, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 24 / 2),
              Container(
                child: Container(
                  height: 600,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(chapterInfo.content,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40 / 2,
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Noto Sans CJK KR, Medium',
                        )),
                  ),
                ),
              ),
              FloatingActionButton.small(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  widget.tapChapterId = chapterInfo.next;
                },
              ),
              FloatingActionButton.small(
                child: Icon(Icons.navigate_before),
                onPressed: () {
                  widget.tapChapterId = chapterInfo.prev;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
