part of 'update_request_by_admin_cubit.dart';

sealed class UpdateRequestByAdminState extends Equatable {
  const UpdateRequestByAdminState();

  @override
  List<Object> get props => [];
}

final class UpdateRequestByAdminInitial extends UpdateRequestByAdminState {}

final class UpdateRequestByAdminFailureState extends UpdateRequestByAdminState {
  final String errorMessage;

  const UpdateRequestByAdminFailureState(this.errorMessage);
}

final class UpdateRequestByAdminSuccessState extends UpdateRequestByAdminState {
  final UpdateRequestByAdminModel updateRequestByAdminModel;

  const UpdateRequestByAdminSuccessState(this.updateRequestByAdminModel);
}

final class UpdateRequestByAdminLoadingState
    extends UpdateRequestByAdminState {}
