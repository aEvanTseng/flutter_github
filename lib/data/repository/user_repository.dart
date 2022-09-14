import 'dart:convert';
import 'package:flutter_github/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_github/data/model/user.dart';

class UserRepository {
  final client = http.Client();
  static const githubToken = Config.githubToken;

  Future<UserList> getUsers() async {
    final response = await client.get(_buildUri(endpoint: "/users"),
        headers: {"authorization": githubToken});

    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);

        final users = (data as List<dynamic>).map((user) {
          return User(
            avatarUrl: user["avatar_url"] ?? '',
            login: user["login"],
            siteAdmin: user["site_admin"] ?? true,
          );
        }).toList();

        return UserList(amount: data.length, users: users);
      default:
        throw const AsyncValue.error('Some error occurred');
    }
  }
}

Uri _buildUri({
  required String endpoint,
}) {
  return Uri(
    scheme: "https",
    host: "api.github.com",
    path: endpoint,
  );
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});
