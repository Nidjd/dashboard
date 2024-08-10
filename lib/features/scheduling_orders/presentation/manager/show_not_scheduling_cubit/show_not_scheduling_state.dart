part of 'show_not_scheduling_cubit.dart';

sealed class ShowNotSchedulingState extends Equatable {
  const ShowNotSchedulingState();

  @override
  List<Object> get props => [];
}

final class ShowNotSchedulingInitial extends ShowNotSchedulingState {}

final class ShowNotSchedulingLoadingState extends ShowNotSchedulingState {}

final class ShowNotSchedulingFailureState extends ShowNotSchedulingState {
  final String errorMessage;

  const ShowNotSchedulingFailureState(this.errorMessage);
}

final class ShowNotSchedulingSuccessState extends ShowNotSchedulingState {
  final ShowNotSchedulingModel showNotSchedulingModel;

  const ShowNotSchedulingSuccessState(this.showNotSchedulingModel);
}
