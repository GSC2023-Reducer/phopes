// // 책 한권에 대한 정보를 받아 이를 class 형식으로 바꿔주는 역할을 정의한다.
// class BookModel {
//   // class에 선언할 변수들을 사전에 정의 / 책 읽음 여부는 수정할 것이므로 var로 선언한다.
//   final String genre, title, author, asset;
//   var isRead;

//   // json으로 부터 받은 객체 정보를 각각 class에 변수 별로 대입하여 정의한다.
//   BookModel.fromJson(Map<String, dynamic> json)
//       : genre = json['genre']!,
//         title = json['title']!,
//         author = json['author']!,
//         isRead = json['isRead']!,
//         asset = json['asset']!;
// }

class OneBook {
  final String genre, title, author, asset;
  var isRead;
  // 나중에 상태 변경할거임

  OneBook(x)
      : genre = x['genre']!,
        title = x['title']!,
        author = x['author']!,
        isRead = x['isRead']!,
        asset = x['asset']!;
}
