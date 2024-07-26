part of 'generate_statistics_cubit.dart';

sealed class GenerateStatisticsState extends Equatable {
  const GenerateStatisticsState();

  @override
  List<Object> get props => [];
}

final class GenerateStatisticsInitial extends GenerateStatisticsState {}

final class GenerateStatisticsLoadingState extends GenerateStatisticsState {}

final class GenerateStatisticsFailureState extends GenerateStatisticsState {
  final String errorMessage;

  const GenerateStatisticsFailureState(this.errorMessage);
}

final class GenerateStatisticsSuccessState extends GenerateStatisticsState {
  final GenerateStatisticsModel generateStatisticsModel;

  const GenerateStatisticsSuccessState(this.generateStatisticsModel);
}
