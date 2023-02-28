class ChapterModel {
  final String id, name, prev, next, content;
  ChapterModel({
    required this.id,
    required this.name,
    required this.prev,
    required this.next,
    required this.content,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> jsonData) {
    return ChapterModel(
      id: jsonData['id'],
      name: jsonData['name'],
      prev: jsonData['prev'],
      next: jsonData['next'],
      content: jsonData['content'],
    );
  }
}
