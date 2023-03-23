import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';
import 'package:phopes/isar_services.dart';

import 'models/book_record.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  final IsarService service = IsarService();

  late Future<List<BookRecord>> sortedBookList; //전체 book이자 정렬된 book
  late Future<List<BookRecord>> finishedBookList; //끝난 book
  int finishedBookCount = 0;
  int totalBookCount = 0;
  @override
  void initState() {
    super.initState();
    sortedBookList = service.sortBookRecords();

    finishedBookList = service.finishedBooks();
    finishedBookList.then((list) {
      finishedBookCount = list.length;
    });

    sortedBookList.then((list) {

      totalBookCount = list.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    service.loadBooks();
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
            endDrawer: const StudentHomeDrawer(),
            body: Center(

              child: FutureBuilder<List<BookRecord>>(
                  future: sortedBookList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<BookRecord>> snapshot) {

                    if (snapshot.hasData) {
                      return Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            decoration: const BoxDecoration(
                              color: Color(0xff2079FF),
                            ),
                            child: Container(

                                margin: EdgeInsets.fromLTRB(20, 120, 0, 0),

                                child: Text(
                                    "Name 님\n현재까지 $finishedBookCount권 읽었어요!",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 30)))),
                        Container(

                          margin: EdgeInsets.fromLTRB(20, 20, 0, 5),

                          width: 500,
                          child: const Text("최근 읽은 책",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 25)),
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(20),
                              scrollDirection: Axis.horizontal,

                              itemCount: 10,
                              itemBuilder: (context, position) {
                                final bookRecord = snapshot.data![position];
                                if (bookRecord.book.value != null) {
                                  return BookPreviewCard(bookRecord);
                                } else {
                                  return const Text("Nothing available");
                                }
                              }),
                        )
                      ]);
                    } else {
                      return const CircularProgressIndicator();
                    }

                  }),
            )));
  }
}
