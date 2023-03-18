import 'package:flutter/material.dart';
// import 'package:phopes/book_detail_page.dart';
import 'package:phopes/models/book_record.dart';

class BookPreviewCard extends StatelessWidget {
  final BookRecord singleBookRecord;

  const BookPreviewCard(this.singleBookRecord, {super.key});

  @override
  Widget build(BuildContext context) {
    String? bookThumbnail = singleBookRecord.book.value?.thumbnail;
    String? bookTitle = singleBookRecord.book.value?.title;
    String? bookAuthor = singleBookRecord.book.value?.author;
    int? id = singleBookRecord.book.value?.id;
    return GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => BookDetailPage(bookId: id)));
        },
        child: Container(
          height: 500,
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffE2EDFF), Color(0xffF7F5E1)], stops: [0, 1]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            surfaceTintColor: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffF1F1F5),
                  ),
                  child: Image.network(bookThumbnail!, height: 220, width: 150),
                ),
                Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Text("$bookTitle",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color: Color(0xff191919),
                                fontSize: 15)),
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        color: Color(0xff707070),
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 150,
                    color: Colors.transparent,
                    child: Text("$bookAuthor",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff767676),
                            fontSize: 15))),
              ],
            ),
          ),
        ));
  }
}
