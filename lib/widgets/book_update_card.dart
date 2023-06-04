import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookUpdateCard extends StatefulWidget {
  final QueryDocumentSnapshot<Object?>? book;
  final List _selectedBooks;
  final Function(String id) _addToSelectedBooks;
  final Function(String id) _removeFromSelectedBooks;
  const BookUpdateCard(this.book, this._selectedBooks, this._addToSelectedBooks,
      this._removeFromSelectedBooks,
      {super.key});

  @override
  State<BookUpdateCard> createState() => _BookUpdateCardState();
}

class _BookUpdateCardState extends State<BookUpdateCard> {
  late bool _isSelected;

  void _changeSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  void initState() {
    _isSelected = widget._selectedBooks.contains(widget.book?.get('id'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String bookId = widget.book!.id;
    String bookTitle = widget.book?.get('title');
    String bookAuthor = widget.book?.get('author');
    String bookThumbnail = widget.book?.get('thumbnail');
    return GestureDetector(
      onTap: () {
        if (!_isSelected) {
          widget._addToSelectedBooks(bookId);
        } else {
          widget._removeFromSelectedBooks(bookId);
        }
        _changeSelected();
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                color: Color(0xffF1F1F5),
              ),
              child: Image.network(
                bookThumbnail,
                height: 220,
                width: 150,
              ),
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
                    child: Text(
                      bookTitle,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color: Color(
                          0xff191919,
                        ),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Checkbox(value: _isSelected, onChanged: (value) {}),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 150,
              color: Colors.transparent,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  bookAuthor,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    color: Color(
                      0xff767676,
                    ),
                    fontSize: 15,
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
