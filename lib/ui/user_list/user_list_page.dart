import 'package:flutter/material.dart';
import 'package:flutter_github/ui/user_list/user_list_provider.dart';
import 'package:flutter_github/ui/user_list/widget/user_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsyncValue = ref.watch(userListProvider);

    return userListAsyncValue.when(
      data: (userList) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: userList.users
                      .map((user) => UserCard(user: user))
                      .toList()),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}
