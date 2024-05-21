part of 'add_worker_cubit.dart';

sealed class AddWorkerState extends Equatable {
  const AddWorkerState();

  @override
  List<Object> get props => [];
}

final class AddWorkerInitial extends AddWorkerState {}

final class AddWorkerLoading extends AddWorkerState {}

final class AddWorkerSuccess extends AddWorkerState {
 final WorkerInfo information;

  const AddWorkerSuccess(this.information);
}

final class AddWorkerFailure extends AddWorkerState {
  final String errMessage;

  const AddWorkerFailure(this.errMessage);
}
