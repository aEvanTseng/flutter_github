class User {
  final String? avatarUrl;
  final String? login;
  final bool? siteAdmin;

  User({this.avatarUrl, this.login, this.siteAdmin});
}

class UserList {
  final int? amount;
  final List<User>? users;

  UserList({
    this.amount,
    this.users,
  });
}
