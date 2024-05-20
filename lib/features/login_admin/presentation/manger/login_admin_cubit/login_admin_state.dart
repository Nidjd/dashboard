part of 'login_admin_cubit.dart';

sealed class LoginAdminState extends Equatable {
  const LoginAdminState();

  @override
  List<Object> get props => [];
}

final class LoginAdminInitial extends LoginAdminState {}

final class LoginAdminSuccess extends LoginAdminState {
  final AdminInforationLogin adminInforationLogin;

  const LoginAdminSuccess(this.adminInforationLogin);
}

final class LoginAdminFailure extends LoginAdminState {
  final String errorMessage;

  const LoginAdminFailure(this.errorMessage);
}

final class LoginAdminLoading extends LoginAdminState {}
