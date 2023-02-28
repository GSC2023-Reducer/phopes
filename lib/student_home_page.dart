import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'book_detail_page.dart';
import 'package:phopes/models/book_model.dart';
import 'package:phopes/models/bookRecord_model.dart';
import 'services/book_services.dart';
import 'services/bookRecord_services.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  // List<Class> classList = List.empty(growable: true);
  // int maxIndex = 0;

  BookModel bookInfo = BookModel(
    title: '',
    thumbnail: '',
    isRead: false,
    numChapters: 0,
    id: '',
    author: '',
  );
  BookRecordModel bookRecordInfo = BookRecordModel(
      bookId: '',
      currentChapter: '',
      isFinished: false,
      startedAt: '',
      lastReadAt: '',
      readChapters: []);

  void waitForData() async {
    print("a");
    bookInfo = await BookInfo.getData();
    print("b");
    bookRecordInfo = await BookRecordInfo.getData();
    print("c");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("d");
    waitForData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xff2079FF),
            centerTitle: true,
            title: const Text("Phopes",
                style: TextStyle(
                    fontFamily: 'Modak',
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                    fontSize: 24)),
            leading: Container()),
        endDrawer: Drawer(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0))),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  accountEmail: const Text(''),
                  accountName: Row(
                    children: <Widget>[
                      Container(
                        child: const CircleAvatar(
                          radius: 26,
                          backgroundColor: Color(0xffF1F1F5),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 110,
                              child: Text('Name',
                                  style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff767676),
                                      fontSize: 24)),
                            ),
                            SizedBox(
                                width: 110,
                                child: Text('컴퓨터프로그래밍',
                                    style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff999999),
                                        fontSize: 12)))
                          ])
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: ListTile(
                      title: const Text('홈',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676),
                              fontSize: 20)),
                      onTap: () {} /*홈이면 그냥 다른 곳 탭해도 되지않나? 홈 listtile이 굳이 필요?*/
                      ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: ListTile(
                        title: const Text('학습플랜',
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                                fontSize: 20)),
                        onTap: () {
                          Navigator.of(context).pushNamed('/study_plan');
                        } /*학습플랜 창으로 넘어가기*/
                        )),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: ListTile(
                      title: const Text('로그아웃',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676),
                              fontSize: 20)),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/code');
                      }),
                )
              ],
            )),
        body: Stack(children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xff2079FF),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
          ),
          Container(
              child: Center(
                  child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: 1,
            itemBuilder: (context, position) {
              if (position == 0) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/book_detail_page',
                        arguments: bookInfo.id,
                      );
                    },
                    child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.white,
                        child: Column(children: <Widget>[
                          Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              color: Colors.transparent,
                              width: double.infinity,
                              child: const Text("최근 읽은 책",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF),
                                      fontSize: 25))),
                          Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF1F1F5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Image.asset(bookInfo.thumbnail,
                                  height: 200, width: 700)),
                          Container(
                            color: Colors.white,
                            child: Container(
                                width: double.infinity,
                                transform:
                                    Matrix4.translationValues(0.0, -13.0, 0.0),
                                child: Text("   ${bookInfo.title}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff191919),
                                        fontSize: 20))),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 4, right: 4),
                              color: Colors.white,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text("나의 학습 진도율",
                                        style: TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff767676),
                                            fontSize: 12)),
                                    Text(
                                        "${int.parse(bookRecordInfo.currentChapter).toDouble() / bookInfo.numChapters.toDouble() * 100}",
                                        style: const TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff767676),
                                            fontSize: 12))
                                  ])),
                          Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              color: Colors.white,
                              child: Container(
                                child: LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    percent:
                                        int.parse(bookRecordInfo.currentChapter)
                                                .toDouble() /
                                            bookInfo.numChapters.toDouble(),
                                    lineHeight: 7,
                                    backgroundColor: const Color(0xffF1F1F5),
                                    progressColor: const Color(0x442079ff)),
                              )),
                          Container(
                              color: Colors.white,
                              child: Container(
                                  height: 1, color: const Color(0xffDBDBDB))),
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 4, right: 4),
                              color: Colors.white,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                        "학습 시작일 ${DateTime.parse(bookRecordInfo.startedAt)}",
                                        style: const TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff767676),
                                            fontSize: 12)),
                                    Text(
                                        "최근 학습일 ${DateTime.parse(bookRecordInfo.lastReadAt)}",
                                        style: const TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff2079FF),
                                            fontSize: 12)),
                                  ])),
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                  height: 1, color: const Color(0xffDBDBDB))),
                        ])));
              }
              return Card(
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Column(children: <Widget>[
                    Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF1F1F5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Image.asset(bookInfo.thumbnail,
                            height: 200, width: 700)),
                    Container(
                      color: Colors.white,
                      child: Container(
                          width: double.infinity,
                          transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                          child: Text("   ${bookInfo.title}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff191919),
                                  fontSize: 20))),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 4, right: 4),
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text("나의 학습 진도율",
                                  style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff767676),
                                      fontSize: 12)),
                              Text(
                                  "${int.parse(bookRecordInfo.currentChapter).toDouble() / bookInfo.numChapters.toDouble() * 100}",
                                  style: const TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff767676),
                                      fontSize: 12))
                            ])),
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        color: Colors.white,
                        child: Container(
                          child: LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              percent: 0.5,
                              lineHeight: 7,
                              backgroundColor: const Color(0xffF1F1F5),
                              progressColor: const Color(0x442079ff)),
                        )),
                    Container(
                        color: Colors.white,
                        child: Container(
                            height: 1, color: const Color(0xffDBDBDB))),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 4, right: 4),
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  "학습 시작일 ${DateTime.parse(bookRecordInfo.startedAt)}",
                                  style: const TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff767676),
                                      fontSize: 12)),
                              Text(
                                  "최근 학습일 ${DateTime.parse(bookRecordInfo.lastReadAt)}",
                                  style: const TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff2079FF),
                                      fontSize: 12)),
                            ])),
                    Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Container(
                            height: 1, color: const Color(0xffDBDBDB))),
                  ]));
            },
          )))
        ]));
  }
}
