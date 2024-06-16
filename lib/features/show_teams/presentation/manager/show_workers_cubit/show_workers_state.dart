part of 'show_workers_cubit.dart';

sealed class ShowWorkersState extends Equatable {
  const ShowWorkersState();

  @override
  List<Object> get props => [];
}

final class ShowWorkersInitial extends ShowWorkersState {}

final class ShowWorkersLoadingstate extends ShowWorkersState {}

final class ShowWorkersFailureState extends ShowWorkersState {
  final String errMessage;

  const ShowWorkersFailureState(this.errMessage);
}

final class ShowWorkersSuccess extends ShowWorkersState {
  final List<ShowWorkersModel> workers;

  const ShowWorkersSuccess(this.workers);
}
