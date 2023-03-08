import 'package:flutter/material.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';
import 'data/book.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  List<Book> bookList = List.empty(growable: true);
  int maxIndex = 0;
  @override
  void initState() {
    super.initState();
    /* DB에 담겨야할 내용*/
    bookList.add(Book(
        bookName: "인공지능",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 20),
        imagePath: "assets/images/littlePrince.jpg",
        progress: 0.7,
        author: "김현우",
        startTime: DateTime.utc(2023, 2, 1)));
    bookList.add(Book(
        bookName: "컴퓨터시스템설계",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 19),
        imagePath: "assets/images/littlePrince.jpg",
        progress: 0.7,
        author: "서태원",
        startTime: DateTime.utc(2023, 2, 2)));
    bookList.add(Book(
        bookName: "데이터베이스",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 21),
        imagePath: "assets/images/littlePrince.jpg",
        progress: 0.7,
        author: "정연돈",
        startTime: DateTime.utc(2023, 2, 3)));
    bookList.add(Book(
        bookName: "운영체제",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 22),
        imagePath: "assets/images/littlePrince.jpg",
        progress: 0.7,
        author: "양경식",
        startTime: DateTime.utc(2023, 2, 4)));
    bookList.add(Book(
        bookName: "임베디드시스템",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 17),
        imagePath: "assets/images/littlePrince.jpg",
        progress: 0.7,
        author: "인호",
        startTime: DateTime.utc(2023, 2, 5)));

    // 진우 FIXME: book라는 클래스 이름은 예약어라서 헷갈릴 소지가 너무 큽니다. 책위젯이니 관련 이름으로 수정하는 게 좋을 것 같습니다.

    bookList.sort(
      (a, b) => b.recentTime.difference(a.recentTime).inMilliseconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
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
          // 진우 : Drawer 위젯으로 뺐습니다.
          endDrawer: const StudentHomeDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color(0xff2079FF),
                  ),
                  child: Container(
                      margin: EdgeInsets.fromLTRB(10, 140, 0, 0),
                      child: Text("Name 님\n현재까지 6권 읽었어요!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF),
                              fontSize: 30)))),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 20, 0, 15),
                    width: 500,
                    child: Text("최근 읽은 책",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff191919),
                            fontSize: 25)),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: bookList.length + 1,
                  itemBuilder: (context, position) {
                    if (position == 0) {
                      return BookPreviewCard(bookList[0]);
                    }
                    return BookPreviewCard(bookList[position - 1]);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
