import 'package:flutter/material.dart';
import 'package:flutter_github/ui/user_detail/user_detail_provider.dart';
import 'package:flutter_github/ui/user_detail/widget/link_card.dart';
import 'package:flutter_github/ui/user_detail/widget/location_card.dart';
import 'package:flutter_github/ui/user_detail/widget/name_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserDetailPage extends ConsumerWidget {
  const UserDetailPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailAsyncValue = ref.watch(userDetailProvider(name));

    return userDetailAsyncValue.when(
      data: (userDetail) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    context.goNamed('users');
                  },
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(userDetail.avatarUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(userDetail.name),
                      const SizedBox(height: 10),
                      Text(userDetail.bio),
                    ],
                  ),
                ),
                const Divider(),
                NameCard(user: userDetail),
                LocationCard(user: userDetail),
                LinkCard(user: userDetail),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}
