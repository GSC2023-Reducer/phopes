class ChaptersModel {
  final String id, bookId;
  final List<ChaptersModelChapter> chapters;
  bool isRead = false;

  ChaptersModel({
    required this.chapters,
    required this.isRead,
    required this.id,
    required this.bookId,
  });

  factory ChaptersModel.fromJson(Map<String, dynamic> jsonData) {
    var list = jsonData['chapters'] as List;
    print(list.runtimeType);
    List<ChaptersModelChapter> chaptersList =
        list.map((i) => ChaptersModelChapter.fromJson(i)).toList();

    return ChaptersModel(
      chapters: chaptersList,
      isRead: jsonData['isRead'],
      id: jsonData['id'],
      bookId: jsonData['bookId'],
    );
  }
}

class ChaptersModelChapter {
  final String bookChapterId, name;
  bool isRead;

  ChaptersModelChapter({
    required this.bookChapterId,
    required this.name,
    required this.isRead,
  });

  factory ChaptersModelChapter.fromJson(Map<String, dynamic> chaptersJsonData) {
    return ChaptersModelChapter(
      bookChapterId: chaptersJsonData['bookChapterId'],
      name: chaptersJsonData['name'],
      isRead: chaptersJsonData['isRead'],
    );
  }
}
