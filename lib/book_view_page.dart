import 'package:flutter/material.dart';
import 'services/chapter_services.dart';
import 'models/chapter_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BookViewPage extends StatefulWidget {
  final String tapChapterId; // book_detail_page에서 id를 가져올 예정
  final bool chapterIsread;
  // chapterIsread는 없어질 예정

  const BookViewPage({
    super.key,
    required this.tapChapterId,
    required this.chapterIsread,
    // chapterIsread는 없어질 예정
  });

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

// "bookChapter"에서 tapchapterid와 일치하는 "id"의 "bookChapter"를 불러온 다음에
// 1. "id" 2. "name" 3. "prev" 4. "next" 5. "content" 를 가져온다.
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
    setState(() {
      widget.chapterIsread;
      // 이 부분은 사라질 예정, 굳이 상태를 불러올 이유가 없다.
    });
  }

  final ScrollController scrollControl = ScrollController();
  double recordProgress = 0;

  @override
  void initState() {
    super.initState();
    waitForData();

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

  // trackCurrentId를 사용하지 않고 onpress 시 바로 바로 반영할 예정이므로 삭제
  var trackCurrentId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 108 / 2,
        backgroundColor: Colors.white,
        title: Text(chapterInfo.name, // 불러온 "bookChapter"에 "name"을 넣는다
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
                    chapterInfo.content,
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
                      onPressed: () async {
                        chapterInfo =
                            await ChapterInfo.getData(chapterInfo.prev);
                        // "bookChapter"의 "prev" 값을 사용해 그 값과 일치하는 bookChapter"의 id"를 tapchapterid로 정해서 초기에 있는 불러오는 과정을 다시 반복해서 적어둘 예정

                        scrollControl.jumpTo(0);
                        setState(
                          () {
                            recordProgress = 0;
                            trackCurrentId = chapterInfo.prev;
                            // 이 부분은 "bookRecord"의 "currentChapter" = "bookChapter"의 "prev"
                          },
                        );
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
                          trackCurrentId = chapterInfo.id;
                          // 이 부분은 "bookRecord"의 "currentChapter" = "bookChapter"의 "id"로 변경
                          Navigator.pop(
                              context, {'id': chapterInfo.id, 'bool': true});
                          // 이부분은 누르면 해당 챕터의 "id"를 "bookrecord"의 "readChapterId"에 등록
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
                        chapterInfo =
                            await ChapterInfo.getData(chapterInfo.next);
                        // "bookChapter"의 "next" 값을 사용해 그 값과 일치하는 bookChapter"의 id"를 tapchapterid로 정해서 초기에 있는 불러오는 과정을 다시 반복해서 적어둘 예정
                        scrollControl.jumpTo(0);

                        setState(
                          () {
                            recordProgress = 0;
                            trackCurrentId = chapterInfo.next;
                            // 이 부분은 "bookRecord"의 "currentChapter" = "bookChapter"의 "next" 로 변경
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
