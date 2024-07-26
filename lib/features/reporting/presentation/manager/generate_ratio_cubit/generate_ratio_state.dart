part of 'generate_ratio_cubit.dart';

sealed class GenerateRatioState extends Equatable {
  const GenerateRatioState();

  @override
  List<Object> get props => [];
}

final class GenerateRatioInitial extends GenerateRatioState {}

final class GenerateRatioLoadingState extends GenerateRatioState {}

final class GenerateRatioFailureState extends GenerateRatioState {
  final String errorMessage;

  const GenerateRatioFailureState(this.errorMessage);
}

final class GenerateRatioSuccessState extends GenerateRatioState {
  final GenerateRatioModel generateRatioModel;

  const GenerateRatioSuccessState(this.generateRatioModel);
}
