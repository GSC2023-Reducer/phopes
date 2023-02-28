class BookRecordModel {
  final String bookId, currentChapter, startedAt, lastReadAt;
  bool isFinished = false;
  final List<BookRecordModelChapter> readChapters;
  BookRecordModel(
      {required this.bookId,
      required this.currentChapter,
      required this.isFinished,
      required this.startedAt,
      required this.lastReadAt,
      required this.readChapters});

  factory BookRecordModel.fromJson(Map<String, dynamic> jsonData) {
    var list = jsonData['readChapters'] as List;
    List<BookRecordModelChapter> readChaptersList =
        list.map((i) => BookRecordModelChapter.fromJson(i)).toList();
    return BookRecordModel(
      readChapters: readChaptersList,
      bookId: jsonData['bookId'],
      currentChapter: jsonData['currentChapter'],
      isFinished: jsonData['isFinished'],
      startedAt: jsonData['startedAt'],
      lastReadAt: jsonData['lastReadAt'],
    );
  }
}

class BookRecordModelChapter {
  final String bookChapterId;

  BookRecordModelChapter({
    required this.bookChapterId,
  });

  factory BookRecordModelChapter.fromJson(
      Map<String, dynamic> chaptersJsonData) {
    return BookRecordModelChapter(
      bookChapterId: chaptersJsonData['bookChapterId'],
    );
  }
}
