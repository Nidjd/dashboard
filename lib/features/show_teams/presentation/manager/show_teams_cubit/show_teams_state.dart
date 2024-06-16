part of 'show_teams_cubit.dart';

sealed class ShowTeamsState extends Equatable {
  const ShowTeamsState();

  @override
  List<Object> get props => [];
}

final class ShowTeamsInitial extends ShowTeamsState {}

final class ShowTeamsLoadingState extends ShowTeamsState {}

final class ShowTeamsFailureState extends ShowTeamsState {
  final String errorMessage;

  const ShowTeamsFailureState(this.errorMessage);
}

final class ShowTeamsSuccessState extends ShowTeamsState {
  final List<ShowTeamPageModel> teams;
  const ShowTeamsSuccessState(this.teams);
}
