part of 'get_vacations_cubit.dart';

sealed class GetVacationsState extends Equatable {
  const GetVacationsState();

  @override
  List<Object> get props => [];
}

final class GetVacationsInitial extends GetVacationsState {}

final class GetVacationsFailureState extends GetVacationsState {
  final String errorMessage;

  const GetVacationsFailureState(this.errorMessage);
}

final class GetVacationsLoadingState extends GetVacationsState {}

final class GetVacationsSuccessState extends GetVacationsState {
  final List<VacationsModel> vacationsModel;

  const GetVacationsSuccessState(this.vacationsModel);
}
