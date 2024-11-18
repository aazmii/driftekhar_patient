class User {
  final String id;
  final List<String> tokens;

  User({required this.id, required this.tokens});
}

class FCMToken {
  List<User> users;

  FCMToken({required this.users});
}
