part of 'get_reports_cubit.dart';

sealed class GetReportsState extends Equatable {
  const GetReportsState();

  @override
  List<Object> get props => [];
}

final class GetReportsInitial extends GetReportsState {}

final class GetReportsFailureState extends GetReportsState {
  final String errorMessage;

  const GetReportsFailureState(this.errorMessage);
}

final class GetReportsLoadingState extends GetReportsState {}

final class GetReportsSuccessState extends GetReportsState {
  final List<ReportsModel> reports;

  const GetReportsSuccessState(this.reports);
}
