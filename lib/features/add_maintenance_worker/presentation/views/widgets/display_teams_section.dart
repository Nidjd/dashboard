import 'package:dashboard/global_variable.dart';
import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/get_teams_cubit/get_teams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayTeamsSection extends StatefulWidget {
  const DisplayTeamsSection({
    super.key,
  });

  @override
  State<DisplayTeamsSection> createState() => _DisplayTeamsSectionState();
}

class _DisplayTeamsSectionState extends State<DisplayTeamsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTeamsCubit, GetTeamsState>(
      builder: (context, state) {
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
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اسم الفريق ",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "عدد اعضاء الفريق ",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
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
              state is GetTeamsSuccess
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: state.teams.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0,
                                    right: 8.0,
                                    top: 4.0,
                                    bottom: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      idSelectedItem = state.teams[index].id;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        color: state.teams[index].id ==
                                                idSelectedItem
                                            ? Colors.blue[200]
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
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
                                          state.teams[index].currentWorkersCount
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
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
                        },
                      ),
                    )
                  : const CustomProgressIndicator(),
              if (state is GetTeamsFailure)
                CustomError(message: state.errorMessage),
            ],
          ),
        ));
      },
    );
  }
}
