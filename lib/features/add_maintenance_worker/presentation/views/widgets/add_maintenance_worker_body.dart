import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/add_maintenance_worker/data/repos/add_maintenance_worker_repo_impl.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/add_worker_cubit/add_worker_cubit.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/manager/get_teams_cubit/get_teams_cubit.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/widgets/add_name_for_worker_section.dart';
import 'package:dashboard/features/add_maintenance_worker/presentation/views/widgets/display_teams_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMaintenanceWorkerBody extends StatelessWidget {
  const AddMaintenanceWorkerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => AddWorkerCubit(getIt.get<AddMaintenanceWorkerRepoImpl>()),
              child: const AddNameForWorkerSection(),
            ),
            BlocProvider(
              create: (context) =>
                  GetTeamsCubit(getIt.get<AddMaintenanceWorkerRepoImpl>())
                    ..getDataOfTeams(),
              child: const DisplayTeamsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
