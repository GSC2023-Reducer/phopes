class User {
  final String userName;
  final String id;
  final String password;
  final DateTime createTime;

  User(
      {required this.userName,
      required this.id,
      required this.password,
      required this.createTime});
}
