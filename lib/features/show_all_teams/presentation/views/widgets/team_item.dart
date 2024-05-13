
import 'package:flutter/material.dart';

class TeamIteam extends StatelessWidget {
  const TeamIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: ListTile(
          title: const Text("name of team"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
          subtitle: const Text("4/5"),
        ),
      ),
    );
  }
}
