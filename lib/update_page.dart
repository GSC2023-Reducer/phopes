import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/models/firebase/book_model.firebase.dart';
import 'package:phopes/models/firebase/chapter_model.firebase.dart';
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
  final _selectedBooks = [];

  void _addToSelectedBooks(String id) {
    if (!_selectedBooks.contains(id)) {
      _selectedBooks.add(id);
    }
  }

  void _removeFromSelectedBooks(String id) {
    _selectedBooks.remove(id);
  }

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
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Updated Books",
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
                    return const CircularProgressIndicator();
                  }
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 7,
                    children: List.generate(
                      snapshot.data!.docs.length,
                      (index) => BookUpdateCard(
                        snapshot.data?.docs[index],
                        _selectedBooks,
                        _addToSelectedBooks,
                        _removeFromSelectedBooks,
                      ),
                    ),
                  );
                }),
          ),
          TextButton(
            onPressed: () async {
              var book =
                  await db.collection("Book").doc(_selectedBooks[0]).get();

              var bookFirebase = BookFirebase(
                id: book.get('id').toString(),
                thumbnail: book.get('thumbnail'),
                author: book.get('author'),
                numChapters: book.get('numChapters'),
                title: book.get('title'),
              );

              var snapshots = await db
                  .collection("Book")
                  .doc(_selectedBooks[0])
                  .collection('chapters')
                  .get();

              // TODO: 이미 있으면 다운로드 X
              // TODO: 없는 책이면 다운로드
              List<ChapterFirebase> temp = [];
              for (var docSnapshot in snapshots.docs) {
                temp.add(ChapterFirebase(
                  id: docSnapshot.id,
                  name: docSnapshot.get('name'),
                  content: docSnapshot.get('content'),
                ));
              }
              await service.saveBook(bookFirebase, temp);
              if (!context.mounted) return;
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Download Done'),
                  content: const Text("Books downloaded"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Confirm'),
                      child: const Text('Confirm'),
                    )
                  ],
                ),
              );
            },
            child: const Text('Download Selected Books'),
          )
        ]));
  }
}
