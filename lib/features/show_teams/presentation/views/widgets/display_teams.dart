import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/show_teams/presentation/manager/show_teams_cubit/show_teams_cubit.dart';
import 'package:dashboard/features/show_teams/presentation/views/show_users.dart';
import 'package:dashboard/features/show_teams/presentation/views/widgets/titles_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DisplayTeams extends StatelessWidget {
  
  const DisplayTeams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowTeamsCubit, ShowTeamsState>(
      builder: (context, state) {
        if (state is ShowTeamsSuccessState) {
          return Expanded(
              child: Container(
            width: 1250,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Column(
              children: [
                const TitlesSection(),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.teams.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>  ShowUsers(id: state.teams[index].id!,),),);
                              
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 8.0, top: 4.0, bottom: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.teams[index].teamName ?? "",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state.teams[index].id.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state.teams[index].currentWorkersCount
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ));
        } else if (state is ShowTeamsFailureState) {
          return CustomError(message: state.errorMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
