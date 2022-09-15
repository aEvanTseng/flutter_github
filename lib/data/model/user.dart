class User {
  final String avatarUrl;
  final String login;
  final bool siteAdmin;

  User({required this.avatarUrl, required this.login, required this.siteAdmin});
}

class UserList {
  final int amount;
  final List<User> users;

  UserList({required this.amount, required this.users});
}

class UserDetail {
  final String avatarUrl;
  final String name;
  final String bio;
  final String login;
  final bool siteAdmin;
  final String location;
  final String blog;

  UserDetail({
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.login,
    required this.siteAdmin,
    required this.location,
    required this.blog,
  });
}
