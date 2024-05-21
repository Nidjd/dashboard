import 'package:bloc/bloc.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/teams/teams.dart';
import 'package:dashboard/features/add_maintenance_worker/data/repos/add_maintenance_worker_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  final AddMaintenanceWorkerRepo _addMaintenanceWorkerRepo;
  GetTeamsCubit(this._addMaintenanceWorkerRepo) : super(GetTeamsInitial());

  Future<void> getDataOfTeams() async {
    emit(GetTeamsLoading());
    var data = await _addMaintenanceWorkerRepo.getTeams();
    
    data.fold((Failure f) {
      emit(GetTeamsFailure(f.eerMessage));
    }, (List<Teams> t) {
      emit(GetTeamsSuccess(t));
    });
  }
}
