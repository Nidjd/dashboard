part of 'leave_request_cubit.dart';

sealed class LeaveRequestState extends Equatable {
  const LeaveRequestState();

  @override
  List<Object> get props => [];
}

final class LeaveRequestInitial extends LeaveRequestState {}

final class LeaveRequestLoadingState extends LeaveRequestState {}

final class LeaveRequestFailureState extends LeaveRequestState {
  final String errorMessage;

  const LeaveRequestFailureState(this.errorMessage);
}

final class LeaveRequestSuccsessState extends LeaveRequestState {
  final LeaveRequestModel leaveRequestModel;

  const LeaveRequestSuccsessState(this.leaveRequestModel);
}
