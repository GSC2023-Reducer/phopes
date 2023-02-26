class OneBook {
  final String genre, title, author, asset, thumb;
  var isRead;
  OneBook(x)
      : genre = x['genre']!,
        title = x['title']!,
        author = x['author']!,
        isRead = x['isRead']!,
        asset = x['asset']!,
        thumb = x['thumb']!;
}