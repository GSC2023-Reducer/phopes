import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/student_home_page.dart';
import 'package:phopes/widgets/book_update_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatePage();
}

class _UpdatePage extends State<UpdatePage> {
  final IsarService service = IsarService();
  final db = FirebaseFirestore.instance;
  List<String> titles = [];
  List<String> authors = [];
  List<String> thumbnails = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          title: const Text("Phopes",
              style: TextStyle(
                  fontFamily: 'Modak',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2079FF),
                  fontSize: 24)),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentHomePage(),
                ),
              );
            },
          ),
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
        ),
        endDrawer: const StudentHomeDrawer(),
        body: Container(
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "March, Update List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff191919),
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection("Book").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        if (index % 2 != 0) {
                          return Row(children: [
                            Expanded(
                              child: BookUpdateCard(
                                  snapshot.data?.docs[index - 1]["title"],
                                  snapshot.data?.docs[index - 1]["author"],
                                  snapshot.data?.docs[index - 1]["thumbnail"]),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: BookUpdateCard(
                                  snapshot.data?.docs[index]["title"],
                                  snapshot.data?.docs[index]["author"],
                                  snapshot.data?.docs[index]["thumbnail"]),
                            )
                          ]);
                        } else {
                          return SizedBox.shrink();
                        }
                      });
                },
              ),
            ),
            TextButton(
              onPressed: () async {
                await service.loadBooks();
                if (!context.mounted) return;
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Download Done'),
                          content: const Text("Books downloaded"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Confirm'),
                              child: const Text('Confirm'),
                            )
                          ],
                        ));
              },
              child: const Text('Download Selected Books'),
            )
          ]),
        ));
  }
}
