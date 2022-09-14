import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/43735695?v=4'),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: const [
                  Text(
                    'Evan',
                    style: TextStyle(fontSize: 16),
                  ),
                  if (true)
                    Card(
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
