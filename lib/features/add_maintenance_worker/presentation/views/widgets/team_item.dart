import 'package:dashboard/global_variable.dart';
import 'package:flutter/material.dart';

class TeamIteam extends StatelessWidget {
  TeamIteam({
    super.key,
    required this.name,
    required this.id,
    required this.numberOfTeam,
    required int memberCount,
  });
   String name;
  final int id;
   int numberOfTeam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 40.0, right: 8.0, top: 4.0, bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name.toString(),
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
          Text(
            id.toString(),
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
          Text(
            numberOfTeam.toString(),
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 4),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.green[900],
    //       borderRadius: BorderRadius.circular(
    //         18,
    //       ),
    //     ),
    //     child: ListTile(
    //       title: Text(name.toString()),
    //       trailing: numberOfTeam == 4
    //           ? const Icon(
    //               Icons.cancel_sharp,
    //             )
    //           : IconButton(
    //               onPressed: () {
    //                 idSelectedItem = id;
    //               },
    //               icon: const Icon(
    //                 Icons.add,
    //               ),
    //             ),
    //       subtitle: Text(
    //         "$numberOfTeam/4",
    //         style: TextStyle(
    //           color: numberOfTeam == 4 ? Colors.red : Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
