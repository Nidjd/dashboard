import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/show_teams/data/repos/teams%20repos/show_teams_repo_impl.dart';
import 'package:dashboard/features/show_teams/presentation/manager/show_teams_cubit/show_teams_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/show_teams_body.dart';

class ShowTeam extends StatelessWidget {
  const ShowTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => ShowTeamsCubit(getIt.get<ShowTeamsRepoImpl>())..getTeams(),
        child: const ShowTeamsBody(),
      ),
    );
  }
}
