import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';
import 'models/book_record.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  final IsarService service = IsarService();

  late Future<List<Book>> bookList; //전체 book이자 정렬된 book
  late Future<List<BookRecord>> finishedBookList; //끝난 book
  int finishedBookCount = 0;
  int totalBookCount = 0;

  @override
  void initState() {
    super.initState();

    bookList = service.getSortedBooks();
    finishedBookList = service.finishedBooks();
    finishedBookList.then((list) {
      finishedBookCount = list.length;
    });
    bookList.then((list) {
      totalBookCount = list.length;
    });
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
            endDrawer: const StudentHomeDrawer(),
            body: Center(
              child: FutureBuilder<List<Book>>(
                  future: bookList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Book>> snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            decoration: const BoxDecoration(
                              color: Color(0xff2079FF),
                            ),
                            child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                    "James\nhas read the $finishedBookCount so far!",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 30)))),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 0, 5),
                          width: 500,
                          child: const Text("Recently read book",
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
                              itemCount: totalBookCount,
                              itemBuilder: (context, position) {
                                final book = snapshot.data![position];
                                return BookPreviewCard(book);
                              }),
                        )
                      ]);
                    }
                    return const CircularProgressIndicator();
                  }),
            )));
  }
}
