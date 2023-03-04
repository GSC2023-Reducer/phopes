import 'package:flutter/material.dart';
import 'services/chapter_services.dart';
import 'models/chapter_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BookViewPage extends StatefulWidget {
  final String tapChapterId;

  const BookViewPage({
    super.key,
    required this.tapChapterId,
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
    scrollControl.addListener(() {
      currentScrollProgress =
          (scrollControl.offset / scrollControl.position.maxScrollExtent);
      setState(() {});
    });
    waitForData();
  }

  final ScrollController scrollControl = ScrollController();
  double currentScrollProgress = 0.0;

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
                height: 600,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: scrollControl,
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
              LinearPercentIndicator(
                lineHeight: 36 / 2,
                percent: currentScrollProgress,
                center: Text(
                  "${(currentScrollProgress * 100).toStringAsFixed(2)}%",
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
              ),
              const SizedBox(height: 24 / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton.extended(
                    heroTag: 'prev',
                    backgroundColor: Colors.blueGrey,
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () async {
                      chapterInfo = await ChapterInfo.getData(chapterInfo.prev);
                      setState(() {});
                    },
                    label: const Text('Prev'),
                  ),
                  FloatingActionButton.extended(
                    heroTag: 'check',
                    icon: const Icon(Icons.check),
                    backgroundColor: (currentScrollProgress > 0.8)
                        ? const Color.fromARGB(255, 10, 134, 250)
                        : const Color.fromARGB(255, 143, 143, 143),
                    onPressed: () {
                      if (currentScrollProgress >= 0.8) {
                        Navigator.pop(
                            context, {'id': chapterInfo.id, 'bool': true});
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
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
                    label: const Text('Read'),
                  ),
                  FloatingActionButton.extended(
                    heroTag: 'next',
                    backgroundColor: Colors.blueGrey,
                    label: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Text("Next"),
                        const Icon(Icons.navigate_next),
                      ],
                    ),
                    icon: Container(),
                    onPressed: () async {
                      chapterInfo = await ChapterInfo.getData(chapterInfo.next);
                      setState(() {});
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
