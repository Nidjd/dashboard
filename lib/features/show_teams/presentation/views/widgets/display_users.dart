import 'package:dashboard/features/add_maintenance_worker/presentation/views/widgets/team_item.dart';
import 'package:flutter/material.dart';

class displayUsers extends StatelessWidget {
  const displayUsers({super.key});

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
        id: 1,
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
        name: 'Team 1',
        id: 1,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 1',
        id: 2,
        memberCount: 5,
        numberOfTeam: 4,
      ),
      TeamIteam(
        name: 'Team 1',
        id: 3,
        memberCount: 5,
        numberOfTeam: 3,
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
      width: 1000, // Set the desired width of the box
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
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم العامل  ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "ايميل العامل ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  " المنصب الوظيفي ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "                 ",
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
                    Row(
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
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
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
          ),
        ],
      ),
      // child: ListView.builder(
      //   itemBuilder: (context, index) => TeamIteam(
      //     name: state.teams[index].teamName ?? "",
      //     id: state.teams[index].id!,
      //     numberOfTeam: state.teams[index].currentWorkersCount!,
      //   ),
      //   itemCount: state.teams.length,
      // ),
    ));
    // } else {
    //   return const CustomProgressIndicator();
  }
  //     },
  //   );
  // }
}
