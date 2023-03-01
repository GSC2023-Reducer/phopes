import 'package:flutter/material.dart';
import 'services/chapter_services.dart';
import 'models/chapter_model.dart';

class BookViewPage extends StatefulWidget {
  final String tapChapterId;
  // final Function(String, bool) tapChangeIsRead;
  // final Function(String, bool) tapChangeIsRead;

  BookViewPage({
    super.key,
    required this.tapChapterId,
    // required this.tapChangeIsRead,
  });

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  ChapterModel chapterInfo = ChapterModel(
    id: '',
    name: '',
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
        title: Text(chapterInfo.name,
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
              SizedBox(
                height: 630,
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
              const SizedBox(height: 24 / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey,
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () {
                      setState(() async {
                        chapterInfo =
                            await ChapterInfo.getData(chapterInfo.prev);
                        setState(() {});
                      });
                    },
                    label: const Text('Prev'),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.blue,
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      // widget.tapChangeIsRead(chapterInfo.id, true);
                    },
                    label: const Text('Read'),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey,
                    label: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Text("Next"),
                        const Icon(Icons.navigate_next),
                      ],
                    ),
                    icon: Container(),
                    onPressed: () {
                      setState(() async {
                        chapterInfo =
                            await ChapterInfo.getData(chapterInfo.next);
                        setState(() {});
                      });
                    },
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
