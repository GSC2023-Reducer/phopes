import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapter.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/daily_contribution.dart';
import 'package:phopes/widgets/student_home_drawer.dart';

final List<Map> item = [
  {
    "contribution": 5,
    "date": DateTime.utc(2023, 1, 1),
  },
  {
    "contribution": 3,
    "date": DateTime.utc(2023, 1, 2),
  },
  {
    "contribution": 2,
    "date": DateTime.utc(2023, 1, 3),
  },
  {
    "contribution": 0,
    "date": DateTime.utc(2023, 1, 4),
  },
  {
    "contribution": 1,
    "date": DateTime.utc(2023, 1, 5),
  },
  {
    "contribution": 2,
    "date": DateTime.utc(2023, 1, 6),
  },
  {
    "contribution": 7,
    "date": DateTime.utc(2023, 1, 7),
  },
];

class StudyPlanPage extends StatefulWidget {
  const StudyPlanPage({super.key});

  @override
  State<StudyPlanPage> createState() => _StudyPlanPageState();
}

class _StudyPlanPageState extends State<StudyPlanPage> {
  late Future<List<DailyRecord>> dailyRecords;
  late Future<List<BookRecord>> finishedBooks;
  late Future<List<BookRecord>> readingBooks;

  @override
  void initState() {
    super.initState();
    final isar = Isar.openSync(
      [
        BookSchema,
        BookRecordSchema,
        BookChaptersSchema,
        BookChapterItemSchema,
        DailyRecordSchema,
      ],
    );

    dailyRecords = isar.dailyRecords.where().findAll();
    finishedBooks = isar.bookRecords.filter().isFinishedEqualTo(true).findAll();
    readingBooks = isar.bookRecords.filter().isFinishedEqualTo(false).findAll();
    // TODO: get 가입 날짜
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.black,
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer: const StudentHomeDrawer(),
        backgroundColor: const Color.fromRGBO(241, 241, 245, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 36.5,
                          backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: Color.fromRGBO(241, 241, 245, 1),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '나의 서재',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('2023.01.15.부터 함께했어요'),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Text(
                      "나의 독서기록",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: FutureBuilder(
                      future: dailyRecords,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => DailyContribution(
                              contribution: snapshot.data![index].chaptersRead
                                  .countSync(),
                              date: snapshot.data![index].createdAt!,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                          );
                        } else if (snapshot.hasError) {
                          return const SizedBox(
                            height: 60,
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Color.fromRGBO(25, 25, 25, 1),
                        unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
                        tabs: [
                          Tab(
                            text: '읽고 있는 책',
                          ),
                          Tab(
                            text: '다 읽은 책',
                          ),
                          Tab(
                            text: '학습 플랜',
                          )
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        child: TabBarView(
                          children: [
                            FutureBuilder(
                              future: readingBooks,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return BookPreviewCard(
                                          snapshot.data![index].book.value);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                  );
                                } else if (snapshot.hasError) {
                                  return const SizedBox(
                                    height: 60,
                                  );
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                            FutureBuilder(
                              future: finishedBooks,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return BookPreviewCard(
                                          snapshot.data![index].book.value);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                  );
                                } else if (snapshot.hasError) {
                                  return const SizedBox(
                                    height: 60,
                                  );
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                            const Text('3'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
