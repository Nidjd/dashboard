import 'package:bloc/bloc.dart';
import 'package:dashboard/features/show_teams/data/models/show%20workers%20model/show.workers.dart';

import 'package:dashboard/features/show_teams/data/repos/worker%20repos/show_workers_repos.dart';
import 'package:equatable/equatable.dart';

part 'show_workers_state.dart';

class ShowWorkersCubit extends Cubit<ShowWorkersState> {
  final ShowWorkersRepo _showWorkersRepo;
  
  ShowWorkersCubit(this._showWorkersRepo) : super(ShowWorkersInitial());
  Future<void> getWorkers({
    required int teamId,
  }) async {
    emit(ShowWorkersLoadingstate());
    
    var data = await _showWorkersRepo.showWorker(teamId: teamId);

    data.fold(
      (l) {
        emit(ShowWorkersFailureState(l.eerMessage));
      },
      (r) {
        emit(ShowWorkersSuccess(r));
      },
    );
  }
}
