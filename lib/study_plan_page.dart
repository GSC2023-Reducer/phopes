import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/daily_record.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/daily_contribution.dart';
import 'package:phopes/widgets/student_home_drawer.dart';

class StudyPlanPage extends StatefulWidget {
  const StudyPlanPage({super.key});

  @override
  State<StudyPlanPage> createState() => _StudyPlanPageState();
}

class _StudyPlanPageState extends State<StudyPlanPage> {
  final IsarService service = IsarService();
  late Future<List<DailyRecord>> dailyRecords;
  late Future<List<BookRecord>> finishedBookRecords;
  late Future<List<BookRecord>> bookRecords;

  @override
  void initState() {
    super.initState();

    dailyRecords = service.getDailyRecords();
    finishedBookRecords = service.finishedBooks();
    bookRecords = service.sortBookRecords();
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 36.5,
                          backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: Color.fromRGBO(241, 241, 245, 1),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'My library',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Since 2023.01.15.'),
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
                      "My reading record",
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
                length: 2,
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
                            text: 'In progress',
                          ),
                          Tab(
                            text: 'Finished',
                          )
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        child: TabBarView(
                          children: [
                            FutureBuilder(
                              future: bookRecords,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return BookPreviewCard(
                                          snapshot.data![index].book.value!);
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
                              future: finishedBookRecords,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return BookPreviewCard(
                                          snapshot.data![index].book.value!);
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
