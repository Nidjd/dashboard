part of 'delete_worker_cubit.dart';

sealed class DeleteWorkerState extends Equatable {
  const DeleteWorkerState();

  @override
  List<Object> get props => [];
}

final class DeleteWorkerInitial extends DeleteWorkerState {}

final class DeleteWorkerLoadingState extends DeleteWorkerState {}

final class DeleteWorkerFailureState extends DeleteWorkerState {
  final String errMessage;

  const DeleteWorkerFailureState(this.errMessage);
}

final class DeleteWorkerSuccessState extends DeleteWorkerState {
  final String response;

  const DeleteWorkerSuccessState(this.response);
}
