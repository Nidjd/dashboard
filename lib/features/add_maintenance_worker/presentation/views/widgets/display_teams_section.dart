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
    return BlocBuilder<GetTeamsCubit, GetTeamsState>(
      builder: (context, state) {
        if (state is GetTeamsFailure) {
          return CustomError(message: state.errorMessage);
        } else if (state is GetTeamsSuccess) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => TeamIteam(
                name: state.teams[index].teamName ?? "",
                id: state.teams[index].id!,
                numberOfTeam: state.teams[index].currentWorkersCount!,
              ),
              itemCount: state.teams.length,
            ),
          );
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
