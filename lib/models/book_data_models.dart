@collection
class User {
  bool isTraveler;
  TravelerAccount travelerAccount;
  StudentAccount studentAccount;
  String username;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.isTraveler,
    required this.travelerAccount,
    required this.studentAccount,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : isTraveler = json['isTraveler'],
        travelerAccount = TravelerAccount.fromJson(json['travelerAccount']),
        studentAccount = StudentAccount.fromJson(json['studentAccount']),
        username = json['username'],
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);
}

class TravelerAccount {
  String id;
  String password;

  TravelerAccount({
    required this.id,
    required this.password,
  });

  TravelerAccount.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'];
}

class StudentAccount {
  String loginCode;
  int avatarType;
  String focus;
  DateTime dateOfBirth;

  StudentAccount({
    required this.loginCode,
    required this.avatarType,
    required this.focus,
    required this.dateOfBirth,
  });

  StudentAccount.fromJson(Map<String, dynamic> json)
      : loginCode = json['loginCode'],
        avatarType = json['avatarType'],
        focus = json['focus'],
        dateOfBirth = DateTime.parse(json['dateOfBirth']);
}

class Book {
  String id;
  String title;
  String author;
  String thumbnail;
  int numChapters;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.thumbnail,
    required this.numChapters,
  });

  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        author = json['author'],
        thumbnail = json['thumbnail'],
        numChapters = json['numChapters'];
}

class BookChapters {
  String id;
  String bookId;
  List<BookChapter> chapters;

  BookChapters({
    required this.id,
    required this.bookId,
    required this.chapters,
  });

  BookChapters.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bookId = json['bookId'],
        chapters = List<BookChapter>.from(json['chapters']
            .map((chapterJson) => BookChapter.fromJson(chapterJson)));
}

class BookChapter {
  String bookChapterId;
  String name;

  BookChapter({
    required this.bookChapterId,
    required this.name,
  });

  BookChapter.fromJson(Map<String, dynamic> json)
      : bookChapterId = json['bookChapterId'],
        name = json['name'];
}

class BookRecord {
  String bookId;
  String currentChapter;
  bool isFinished;
  DateTime startedAt;
  DateTime lastReadAt;
  List<BookChapter> readChapters;

  BookRecord({
    required this.bookId,
    required this.currentChapter,
    required this.isFinished,
    required this.startedAt,
    required this.lastReadAt,
    required this.readChapters,
  });

  BookRecord.fromJson(Map<String, dynamic> json)
      : bookId = json['bookId'],
        currentChapter = json['currentChapter'],
        isFinished = json['isFinished'],
        startedAt = DateTime.parse(json['startedAt']),
        lastReadAt = DateTime.parse(json['lastReadAt']),
        readChapters = List<BookChapter>.from(json['readChapters']
            .map((chapterJson) => BookChapter.fromJson(chapterJson)));
}

class DailyRecord {
  DateTime createdAt;
  int numChaptersRead;

  DailyRecord({
    required this.createdAt,
    required this.numChaptersRead,
  });

  DailyRecord.fromJson(Map<String, dynamic> json)
      : createdAt = DateTime.parse(json['createdAt']),
        numChaptersRead = json['numChaptersRead'];
}
