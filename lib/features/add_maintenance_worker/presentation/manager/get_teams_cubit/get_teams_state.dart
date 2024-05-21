part of 'get_teams_cubit.dart';

sealed class GetTeamsState extends Equatable {
  const GetTeamsState();

  @override
  List<Object> get props => [];
}

final class GetTeamsInitial extends GetTeamsState {}

final class GetTeamsFailure extends GetTeamsState {
  final String errorMessage;

  const GetTeamsFailure(this.errorMessage);
}

final class GetTeamsSuccess extends GetTeamsState {
  final List<Teams> teams;

  const GetTeamsSuccess(this.teams);
}

final class GetTeamsLoading extends GetTeamsState {}
