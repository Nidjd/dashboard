import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/get_teams_cubit/get_teams_cubit.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/widgets/team_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayTeamsSection extends StatelessWidget {
  const DisplayTeamsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var teams = [
      TeamIteam(
        name: 'Team 1',
        id: 1,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 2',
        id: 2,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 3',
        id: 3,
        memberCount: 5,
        numberOfTeam: 3,
      ),
      TeamIteam(
        name: 'Team 4',
        id: 1,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 5',
        id: 2,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 6',
        id: 3,
        memberCount: 5,
        numberOfTeam: 3,
      ),
      TeamIteam(
        name: 'Team 7',
        id: 1,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 8',
        id: 2,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 9',
        id: 3,
        memberCount: 5,
        numberOfTeam: 3,
      ),
      TeamIteam(
        name: 'Team 10',
        id: 1,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 11',
        id: 2,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 12',
        id: 3,
        memberCount: 5,
        numberOfTeam: 3,
      ),
      TeamIteam(
        name: 'Team 122',
        id: 12,
        memberCount: 5,
        numberOfTeam: 4,
      ),

      // Add more teams as needed
    ];
    // return BlocBuilder<GetTeamsCubit, GetTeamsState>(
    //   builder: (context, state) {
    //     if (state is GetTeamsFailure) {
    //       return CustomError(message: state.errorMessage);
    //     } else if (state is GetTeamsSuccess) {
    return Expanded(
        child: Container(
      width: 1250, // Set the desired width of the box
      height: 300, // Set the desired height of the box
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.circular(10.0), // Apply rounded corners
        border: Border.all(
          // Add the border
          color: Colors.grey, // Set the color of the border
          width: 2.0, // Set the thickness of the border
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم الفريق ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "عنوان  الفريق",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "عدد اعضاء الفريق ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 8.0, top: 4.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            team.name,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            team.id.toString(),
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            team.numberOfTeam.toString(),
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade100,
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                );
                // return ListTile(
                //   leading: Text(team.name),
                //   subtitle: Text(team.id.toString()),
                //   trailing: Text(team.numberOfTeam.toString()),
                // );
              },
            ),
          )
        ],
      ),
    ));
    // } else {
    //   return const CustomProgressIndicator();
  }
  //     },
  //   );
  // }
}
// child: ListView.builder(
      //   itemBuilder: (context, index) => TeamIteam(
      //     name: state.teams[index].teamName ?? "",
      //     id: state.teams[index].id!,
      //     numberOfTeam: state.teams[index].currentWorkersCount!,
      //   ),
      //   itemCount: state.teams.length,
      // ),