import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/get_teams_cubit/get_teams_cubit.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/widgets/team_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayTeams extends StatelessWidget {
  const DisplayTeams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم الفريق ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "معرّف الفريق",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "عدد اعضاء الفريق ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  "عدد المهمات المنجزة",
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
          const ListTile(),
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
