import 'package:flutter/material.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';
import 'data/class.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  List<Class> classList = List.empty(growable: true);
  int maxIndex = 0;
  @override
  void initState() {
    super.initState();
    /* DB에 담겨야할 내용*/
    classList.add(Class(
        className: "인공지능",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 20),
        imagePath: "repo/images/dog.png",
        progress: 0.7,
        startTime: DateTime.utc(2023, 2, 1)));
    classList.add(Class(
        className: "컴퓨터시스템설계",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 19),
        imagePath: "repo/images/dog.png",
        progress: 0.7,
        startTime: DateTime.utc(2023, 2, 2)));
    classList.add(Class(
        className: "데이터베이스",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 21),
        imagePath: "repo/images/dog.png",
        progress: 0.7,
        startTime: DateTime.utc(2023, 2, 3)));
    classList.add(Class(
        className: "운영체제",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 22),
        imagePath: "repo/images/dog.png",
        progress: 0.7,
        startTime: DateTime.utc(2023, 2, 4)));
    classList.add(Class(
        className: "임베디드시스템",
        finish: false,
        recentTime: DateTime.utc(2023, 2, 17),
        imagePath: "repo/images/dog.png",
        progress: 0.7,
        startTime: DateTime.utc(2023, 2, 5)));

    // 진우 FIXME: Class라는 클래스 이름은 예약어라서 헷갈릴 소지가 너무 큽니다. 책위젯이니 관련 이름으로 수정하는 게 좋을 것 같습니다.

    classList.sort(
      (a, b) => b.recentTime.difference(a.recentTime).inMilliseconds,
    );
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
      // 진우 : Drawer 위젯으로 뺐습니다.
      endDrawer: const StudentHomeDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xff2079FF),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
          ),
          Center(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: classList.length + 1,
              itemBuilder: (context, position) {
                if (position == 0) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/book_detail_page',
                        /*arguments: const BookDetailPage(
                          bookId: '3bqdJxSYWZ25UNiN6pT0',
                        ),*/
                      );
                    },
                    child: BookPreviewCard(classList[0]),
                  );
                }
                return BookPreviewCard(classList[position - 1]);
              },
            ),
          )
        ],
      ),
    );
  }
}
