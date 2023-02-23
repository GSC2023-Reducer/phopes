import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

// class ApiService {
//   final String baseUrl = '';
//   final String a = '';
//   // 서버가 정해지면 채울 예정

//   // 서버에서 데이터를 가져올때까지 기다려서 빈 데이터 오류를 방지하는 비동기 함수를 사용한다.
//   Future<List<BookModel>> getData() async {
//     List<BookModel> bookInstances = [];

//     // 서버 경로를 만들고,
//     final url = Uri.parse('$baseUrl/$a');

//     // http 라이브러리를 이용해서 서버에서  데이터를 가져온다.
//     final response = await http.get(url);
//     // 이때 타입은 future인데 이는 데이터를 가져온 후에 type을 결정하는 유형이다.

//     // 200의 statusCode를 가지면(공식 문서에 나옴) 정상 상태이다.
//     if (response.statusCode == 200) {
//       // 정상 상태의 경우 String 타입의 데이터를 json 형식으로 디코딩하여 변수에 저장한다.
//       final List<dynamic> Books = jsonDecode(response.body);

//       // 데이터는 리스트 내부에 각각의 객체로 여러개의 책 정보가 담겨져 있어 for문을 통해 이를 하나씩 뽑는다.
//       for (var Book in Books) {
//         // json 객체를 받아 book_model.dart 파일의 BookModel을 가져와 인스턴스로 변환하여 저장한다.
//         bookInstances.add(BookModel.fromJson(Book));
//         // 빈리스트에 인스턴스로 변환한 책 정보를 넣을 것이다.
//       }
//       return bookInstances;
//     }
//     throw Error();
//   }
// }

class dataSerive {
  static getData() {
    // fake data
    final List<Map<String, dynamic>> booksData = [
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 1',
        'author': '정모씨',
        'isRead': 'false',
        'asset': 'assets/images/books.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 2',
        'author': '정양',
        'isRead': 'false',
        'asset': 'assets/images/b.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 3',
        'author': '정씨',
        'isRead': 'false',
        'asset': 'assets/images/books.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 4',
        'author': '정소녀',
        'isRead': 'false',
        'asset': 'assets/images/b.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 6',
        'author': '정소년',
        'isRead': 'false',
        'asset': 'assets/images/b.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 7',
        'author': '정청년',
        'isRead': 'false',
        'asset': 'assets/images/books.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 8',
        'author': '정군',
        'isRead': 'false',
        'asset': 'assets/images/b.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 9',
        'author': '정할머니',
        'isRead': 'false',
        'asset': 'assets/images/books.jpg'
      },
      {
        'genre': '여행',
        'title': '걸어서 일산 속으로 10',
        'author': '정할아버지',
        'isRead': 'false',
        'asset': 'assets/images/books.jpg'
      }
    ];

    List<OneBook> books = [];

    for (var book in booksData) {
      // json 객체를 받아 book_model.dart 파일의 BookModel을 가져와 인스턴스로 변환하여 저장한다.
      books.add(OneBook(book));
      // 빈리스트에 인스턴스로 변환한 책 정보를 넣을 것이다.
    }
    return books;
  }
}
