import 'package:flutter/material.dart';
import 'package:flutter_github/data/model/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    user.login,
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (user.siteAdmin)
                    const Card(
                      color: Colors.purple,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'STAFF',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
