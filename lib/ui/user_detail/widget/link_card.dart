import 'package:flutter/material.dart';
import 'package:flutter_github/data/model/user.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({Key? key, required this.user}) : super(key: key);

  final UserDetail user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(Icons.link, size: 50),
          const SizedBox(width: 10),
          InkWell(
            child: Text(
              user.blog,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
