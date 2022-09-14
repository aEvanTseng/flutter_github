import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_github/data/model/user.dart';

class UserRepository {
  final client = http.Client();
  static const String githubToken = "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";

  Future<UserList> getUsers() async {
    final response = await client.get(_buildUri(endpoint: "/users"),
        headers: {"authorization": githubToken});

    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);

        return UserList(
          amount: data.length,
          users: data.map((user) {
            return User(
              avatarUrl: user["avatar_url"],
              login: user["login"],
              siteAdmin: user["site_admin"],
            );
          }).toList(),
        );
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