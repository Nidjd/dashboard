import 'package:bloc/bloc.dart';
import 'package:dashboard/features/show_teams/data/models/show_team_page_model/show_team_page_model.dart';
import 'package:dashboard/features/show_teams/data/repos/teams%20repos/show_teams_repo.dart';
import 'package:equatable/equatable.dart';

part 'show_teams_state.dart';

class ShowTeamsCubit extends Cubit<ShowTeamsState> {
  final ShowTeamsRepo _showTeamsRepo;
  ShowTeamsCubit(this._showTeamsRepo) : super(ShowTeamsInitial());

  Future<void> getTeams() async {
    emit(ShowTeamsLoadingState());
    var data = await _showTeamsRepo.showTeams();
    data.fold(
      (l) {
        emit(ShowTeamsFailureState(l.eerMessage));
      },
      (r) {
        emit(ShowTeamsSuccessState(r));
      },
    );
  }
}
