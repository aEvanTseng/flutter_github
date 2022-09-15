import 'package:flutter/material.dart';
import 'package:flutter_github/data/model/user.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key, required this.user}) : super(key: key);

  final UserDetail user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(Icons.location_on, size: 50),
          const SizedBox(width: 10),
          Text(
            user.location,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
