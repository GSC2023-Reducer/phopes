import 'package:flutter/material.dart';
import 'package:phopes/models/book.dart';
import 'package:phopes/models/book_chapters.dart';
import 'package:phopes/models/book_record.dart';
import 'package:phopes/models/book.dart';
import 'book_view_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:isar/isar.dart';

class BookDetailPage extends StatefulWidget {
  int bookId = 4089735379470416465;
  //book 이건 받아옴 진우님 페이지

  BookDetailPage({
    super.key,
    // required this.bookId,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPage();
}

// 클릭 할때 해당 book id를 이전 페이지에서 받아야함
// book id를 바탕으로 해당 책의
// 1. 제목, 2. 썸네일 3. 책 읽음 여부 4. 챕터 총 개수 5. 작가 를 가져와야함

class _BookDetailPage extends State<BookDetailPage> {
  late Isar isar;
  late BookRecord bookRecord;
  late Book book;
  late BookChapters bookchapters;

  @override
  void initState() {
    super.initState();
    openIsar();
  }

  @override
  void dispose() {
    closeIsar();
    super.dispose();
  }

  Future<void> openIsar() async {
    var isar = await Isar.open([BookRecordSchema]);
    final bookRecord = isar.collection<BookRecord>().get(1016922496390167466);

    isar = await Isar.open([BookChaptersSchema]);
    final bookChapters =
        isar.collection<BookChapters>().get(6322331398973074595);

    isar = await Isar.open([BookSchema]);
    final book = isar.collection<Book>().get(widget.bookId);
  }

  void closeIsar() {
    isar.close();
  }

  // ignore: prefer_typing_uninitialized_variables
  var tapChapterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 108 / 2,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xff191919)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 0, 48 / 2, 10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 654 / 2,
                      height: 1426 / 2,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(127, 158, 158, 158),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(10 / 2, 10 / 2),
                                  ),
                                ],
                              ),
                              child: Image(
                                  image: AssetImage(book.thumbnail!),
                                  //  "book" ->  "thumbnail" 여기서 가져온 썸네일로 바꿔주기
                                  width: 328 / 2,
                                  height: 490 / 2,
                                  fit: BoxFit.fill),
                            ),
                            const SizedBox(height: 44 / 2),
                            SizedBox(
                              height: 70 / 2,
                              child: Text(
                                book.title!,
                                // "book" -> "title" 가져온 책 제목으로 바꿔주기
                                style: const TextStyle(
                                    color: Colors.black,
                                    letterSpacing: -1.2 / 2,
                                    fontSize: 48 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 28 / 2),
                            SizedBox(
                              height: 40 / 2,
                              child: Text(
                                book.author!,
                                //  "book" ->  "author" 가져온 책 작가로 바꿔주기
                                style: const TextStyle(
                                    color: Color(0xff767676),
                                    fontSize: 28 / 2,
                                    letterSpacing: 0,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const SizedBox(height: 32 / 2),
                            LinearPercentIndicator(
                              width: 654 / 2,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 14 / 2,
                              percent: bookRecord.readChapters.length /
                                  book.numChapters!,
                              // "book" ->  "numChapters"를 가져오고 가져온 전체 챕터 수 //  "bookRecord" -> "readChapters"의 [] 전체 수의 나누기를 통해 percent를 기록한다.
                              progressColor: const Color(0xff2079FF),
                              backgroundColor: const Color(0xffF1F1F5),
                            ),
                            const SizedBox(height: 44 / 2),
                            Container(
                              height: 2 / 2,
                              color: const Color(0xffDBDBDB),
                            ),
                            SizedBox(
                              width: 654 / 2,
                              height: 662 / 2,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                //"bookChapters" ->   "chapters"를 가져온 다음 이것을 mapping 해서 하나씩 꺼내기
                                children: bookchapters.chapters.map(
                                  (x) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            tapChapterId = x.id;
                                            // 이 부분에서 우변은 메핑한 x에서 "chapters" -> "bookChapterId"를 넣을 예정
                                          },
                                        );
                                        Navigator.push(
                                          //북 챕터를 누르면 해당 챕터 아이디를 넘겨줌
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BookViewPage(
                                              tapChapterId: tapChapterId,
                                            ),
                                            fullscreenDialog: true,
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              x.name!,
                                              // 메핑한 대상에 "name" 그대로 가져오면 된다.
                                              style: const TextStyle(
                                                color: Color(0xff767676),
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    'Noto Sans CJK KR, Medium',
                                              ),
                                            ),
                                            leading: const Icon(Icons.book),
                                            trailing:
                                                const Icon(Icons.check_circle),
                                            iconColor: (bookRecord.readChapters
                                                        .map((chapter) =>
                                                            chapter.id)
                                                        .contains(x.id) ==
                                                    true) // 메핑할때 가져온  "bookChapterId"가 "bookRecord" ->  "readChapters"에 존재하는 아이디 라면 이 이제 해당 조건
                                                ? const Color(0xff2079FF)
                                                : null,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          Container(
                                            height: 2 / 2,
                                            color: const Color(0xffDBDBDB),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 658 / 2,
              right: 47 / 2,
              child: SizedBox(
                width: 60 / 2,
                height: 35 / 2,
                child: Text(
                  "${((bookRecord.readChapters.length / book.numChapters!) * 100).ceil()}%",
                  // "bookRecord" -> "readChapters"의 [] 안에 있는 수 / "book" ->  "numChapters" 수
                  style: const TextStyle(
                      fontSize: 24 / 2,
                      color: Color(0xff767676),
                      letterSpacing: -0.6 / 2,
                      fontFamily: 'Noto Sans CJK KR, Medium',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Positioned(
              top: 1211 / 2,
              right: 65 / 2,
              child: SizedBox(
                width: 619 / 2,
                height: 98 / 2,
                child: FloatingActionButton.extended(
                  extendedPadding:
                      const EdgeInsets.fromLTRB(23 / 2, 27 / 2, 22 / 2, 27 / 2),
                  elevation: 3,
                  backgroundColor: const Color(0xff2079FF),
                  label: (bookRecord.readChapters.length != book.numChapters)
                      // "bookRecord" -> "readChapters"의 [] 안에 있는 수 != "book" ->  "numChapters" 수
                      ? const Text(
                          "이어 읽기",
                          style: TextStyle(
                            fontSize: 32 / 2,
                            letterSpacing: -0.8 / 2,
                            fontFamily: 'Noto Sans CJK KR, Bold',
                            color: Color(0xffFFFFFF),
                          ),
                        )
                      : const Text(
                          "독서 완료",
                          style: TextStyle(
                            fontSize: 32 / 2,
                            letterSpacing: -0.8 / 2,
                            fontFamily: 'Noto Sans CJK KR, Bold',
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                  onPressed: () async {
                    /*80퍼센트 달성시 (변화 없고)
버튼 활성화 해서
누르면 isfinishied를 바꾼다
 */
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22 / 2)),
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
