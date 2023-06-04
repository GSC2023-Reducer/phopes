class BookFirebase {
  final String id;
  final String author;
  final int numChapters;
  final String thumbnail;
  final String title;

  const BookFirebase({
    required this.id,
    required this.author,
    required this.numChapters,
    required this.thumbnail,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "numChapters": numChapters,
        "thumbnail": thumbnail,
        "title": title,
      };
}
