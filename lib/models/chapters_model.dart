class ChaptersModel {
  final String id, bookId;
  final List<ChapterModel> chapters;
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
    List<ChapterModel> chaptersList =
        list.map((i) => ChapterModel.fromJson(i)).toList();

    return ChaptersModel(
      chapters: chaptersList,
      isRead: jsonData['isRead'],
      id: jsonData['id'],
      bookId: jsonData['bookId'],
    );
  }
}

class ChapterModel {
  final String bookChapterId, name;
  bool isRead = false;

  ChapterModel({
    required this.bookChapterId,
    required this.name,
    required this.isRead,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> chaptersListJsonData) {
    return ChapterModel(
      bookChapterId: chaptersListJsonData['bookChapterId'],
      name: chaptersListJsonData['name'],
      isRead: chaptersListJsonData['isRead'],
    );
  }
}
