import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/delete_worker_repo_impl.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/show_workers_repo_impl.dart';
import 'package:dashboard/features/show_teams/presentation/manager/delete_worker_cubit/delete_worker_cubit.dart';
import 'package:dashboard/features/show_teams/presentation/manager/show_workers_cubit/show_workers_cubit.dart';
import 'package:dashboard/features/show_teams/presentation/views/widgets/show_users_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUsers extends StatelessWidget {
  final int id;
  const ShowUsers({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ShowWorkersCubit(getIt.get<ShowWorkersRepoImpl>())
                  ..getWorkers(teamId: id),
          ),
          BlocProvider(
            create: (context) => DeleteWorkerCubit(getIt.get<DeleteWorkerRepoImpl>()),
          ),
        ],
        child: const ShowUsersBody(),
      ),
    );
  }
}
