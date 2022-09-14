import 'package:flutter/material.dart';
import 'package:flutter_github/ui/user_list/user_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/user_list',
      routes: <GoRoute>[
        GoRoute(
          name: 'user_list',
          path: '/user_list',
          builder: (BuildContext context, GoRouterState state) =>
              const UserListPage(),
        )
      ],
    );

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Flutter Github',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
