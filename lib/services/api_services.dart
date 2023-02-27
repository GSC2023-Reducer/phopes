import '../models/book_model.dart';

class dataService {
  static getData() {
    final List<Map<String, dynamic>> booksData = [
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 1',
        'author': '정모씨',
        'isRead': 'false',
        'thumb': 'assets/images/books.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 2',
        'author': '정양',
        'isRead': 'false',
        'thumb': 'assets/images/b.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 3',
        'author': '정씨',
        'isRead': 'false',
        'thumb': 'assets/images/books.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 4',
        'author': '정소녀',
        'isRead': 'false',
        'thumb': 'assets/images/b.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 6',
        'author': '정소년',
        'isRead': 'false',
        'thumb': 'assets/images/b.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 7',
        'author': '정청년',
        'isRead': 'false',
        'thumb': 'assets/images/books.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 8',
        'author': '정군',
        'isRead': 'false',
        'thumb': 'assets/images/b.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 9',
        'author': '정할머니',
        'isRead': 'false',
        'thumb': 'assets/images/books.jpg',
        'asset': 'assets/q656.pdf'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 10',
        'author': '정할아버지',
        'isRead': 'false',
        'thumb': 'assets/images/books.jpg',
        'asset': 'assets/q656.pdf'
      }
    ];

    List<OneBook> books = [];

    for (var book in booksData) {
      books.add(OneBook(book));
    }
    return books;
  }
}
