class BookModel {
  final String title, author, thumbnail, id;
  int numChapters;
  bool isRead = false;
  BookModel({
    required this.title,
    required this.author,
    required this.isRead,
    required this.thumbnail,
    required this.numChapters,
    required this.id,
  });

  factory BookModel.fromJson(Map<String, dynamic> jsonData) {
    return BookModel(
      title: jsonData['title'],
      author: jsonData['author'],
      isRead: jsonData['isRead'],
      thumbnail: jsonData['thumbnail'],
      numChapters: jsonData['numChapters'],
      id: jsonData['id'],
    );
  }
}
