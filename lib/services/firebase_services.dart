import 'package:firebase_database/firebase_database.dart';
import 'package:isar/isar.dart';
import '../models/book_data_models.dart';

Future<void> syncDataWithIsar() async {
  final DatabaseReference reference = FirebaseDatabase.instance.reference();

  final userSnapshots = await reference.child('users').get();
  final List<User> users = userSnapshots.value.entries.map((e) {
    final userData = e.value as Map<String, dynamic>;
    return User.fromJson({
      ...userData,
      'username': e.key,
    });
  }).toList();

  final bookSnapshots = await reference.child('books').get();
  final List<Book> books = bookSnapshots.value.entries.map((e) {
    final bookData = e.value as Map<String, dynamic>;
    return Book.fromJson({
      ...bookData,
      'id': e.key,
    });
  }).toList();

  final bookChapterSnapshots = await reference.child('bookChapters').get();
  final List<BookChapters> bookChapters =
      bookChapterSnapshots.value.entries.map((e) {
    final chapterData = e.value as Map<String, dynamic>;
    return BookChapters.fromJson({
      ...chapterData,
      'id': e.key,
    });
  }).toList();

  final bookRecordSnapshots = await reference.child('bookRecords').get();
  final List<BookRecord> bookRecords =
      bookRecordSnapshots.value.entries.map((e) {
    final recordData = e.value as Map<String, dynamic>;
    return BookRecord.fromJson({
      ...recordData,
      'bookId': e.key,
    });
  }).toList();

  final dailyRecordSnapshots = await reference.child('dailyRecords').get();
  final List<DailyRecord> dailyRecords =
      dailyRecordSnapshots.value.entries.map((e) {
    final recordData = e.value as Map<String, dynamic>;
    return DailyRecord.fromJson({
      ...recordData,
      'createdAt': DateTime.parse(e.key),
    });
  }).toList();

  final isar = await openIsar();

  await isar.writeTxn((isar) async {
    await isar.users.putAll(users);
    await isar.books.putAll(books);
    await isar.bookChapters.putAll(bookChapters);
    await isar.bookRecords.putAll(bookRecords);
    await isar.dailyRecords.putAll(dailyRecords);
  });

  await isar.close();
}
