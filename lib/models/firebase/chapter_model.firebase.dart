class ChapterFirebase {
  final String id;
  final String content;
  final String name;

  const ChapterFirebase({
    required this.id,
    required this.content,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "name": name,
      };
}
