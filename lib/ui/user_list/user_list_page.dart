import 'package:flutter/material.dart';
import 'package:flutter_github/ui/user_list/widget/user_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// github token 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

final dummyUser = {
  'id': 1,
  'login': 'test user',
  'avatar_url': 'https://avatars.githubusercontent.com/u/43735695?v=4'
};

class UserListPage extends ConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            UserCard(),
            UserCard(),
            UserCard(),
          ],
        ),
      ),
    );
  }
}
