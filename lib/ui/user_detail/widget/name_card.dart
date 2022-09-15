import 'package:flutter/material.dart';
import 'package:flutter_github/data/model/user.dart';

class NameCard extends StatelessWidget {
  const NameCard({Key? key, required this.user}) : super(key: key);

  final UserDetail user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(Icons.account_box, size: 50),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                user.name,
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
        ],
      ),
    );
  }
}
