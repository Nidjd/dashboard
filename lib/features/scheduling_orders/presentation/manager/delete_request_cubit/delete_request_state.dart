part of 'delete_request_cubit.dart';

sealed class DeleteRequestState extends Equatable {
  const DeleteRequestState();

  @override
  List<Object> get props => [];
}

final class DeleteRequestInitial extends DeleteRequestState {}

final class DeleteRequestLoadingState extends DeleteRequestState {}

final class DeleteRequestFailureState extends DeleteRequestState {
  final String errorMessage;

  const DeleteRequestFailureState(this.errorMessage);
}

final class DeleteRequestSuccessState extends DeleteRequestState {
  final String message;

  const DeleteRequestSuccessState(this.message);
}
