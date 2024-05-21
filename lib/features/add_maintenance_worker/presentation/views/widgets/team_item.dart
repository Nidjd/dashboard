import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

class TeamIteam extends StatelessWidget {
  const TeamIteam({
    super.key,
    required this.name,
    required this.id,
    required this.numberOfTeam,
  });
  final String name;
  final int id;
  final int numberOfTeam;

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
          title: Text(name.toString()),
          trailing: numberOfTeam == 4
              ? const Icon(
                  Icons.cancel_sharp,
                )
              : IconButton(
                  onPressed: () {
                    idSelectedItem = id;
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
          subtitle: Text(
            "$numberOfTeam/4",
            style: TextStyle(
              color: numberOfTeam == 4 ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
