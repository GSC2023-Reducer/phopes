import 'package:flutter/material.dart';
import 'package:phopes/book_detail_page.dart';
import 'package:phopes/models/book.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookUpdateCard extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnail;
  const BookUpdateCard(this.title, this.author, this.thumbnail, {super.key});

  @override
  Widget build(BuildContext context) {
    String? bookTitle = title;
    String? bookAuthor = author;
    String? bookThumbnail = thumbnail;
    return Card(
      elevation: 0,
      color: Colors.transparent,
      surfaceTintColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
              color: Color(0xffF1F1F5),
            ),
            child: Image.network(bookThumbnail!, height: 220, width: 150),
          ),
          Container(
            width: 150,
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 95,
                  color: Colors.transparent,
                  child: Text(bookTitle!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff191919),
                          fontSize: 15)),
                ),
                Checkbox(value: false, onChanged: (value) {}),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 150,
            color: Colors.transparent,
            child: Text(
              bookAuthor!,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff767676),
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
