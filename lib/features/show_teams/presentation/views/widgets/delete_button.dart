

import 'package:dashboard/features/show_teams/presentation/manager/delete_worker_cubit/delete_worker_cubit.dart';
import 'package:dashboard/features/show_teams/presentation/manager/show_workers_cubit/show_workers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  final int id;
  final int teamId;
  const DeleteButton({
    super.key,
    required this.id,
    required this.teamId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteWorkerCubit, DeleteWorkerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            await BlocProvider.of<DeleteWorkerCubit>(context)
                .deleteWorker(id: id);

            await BlocProvider.of<ShowWorkersCubit>(context)
                .getWorkers(teamId: teamId);
          },
          icon: const Icon(
            Icons.delete,
          ),
        );
      },
    );
  }
}
