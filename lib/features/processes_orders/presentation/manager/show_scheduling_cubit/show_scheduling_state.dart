part of 'show_scheduling_cubit.dart';

sealed class ShowSchedulingState extends Equatable {
  const ShowSchedulingState();

  @override
  List<Object> get props => [];
}

final class ShowSchedulingInitial extends ShowSchedulingState {}

final class ShowSchedulingFailureState extends ShowSchedulingState {
  final String errorMessage;

  const ShowSchedulingFailureState(this.errorMessage);
}

final class ShowSchedulingSuccessState extends ShowSchedulingState {
  final ShowSchedulingModel showSchedulingModel;

  const ShowSchedulingSuccessState(this.showSchedulingModel);
}

final class ShowSchedulingLoadingState extends ShowSchedulingState {}
