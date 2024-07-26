import 'package:bloc/bloc.dart';
import 'package:dashboard/features/reporting/data/models/generate_statistics_model.dart';
import 'package:dashboard/features/reporting/data/repos/generate_statistics_repo.dart';
import 'package:equatable/equatable.dart';

part 'generate_statistics_state.dart';

class GenerateStatisticsCubit extends Cubit<GenerateStatisticsState> {
  final GenerateStatisticsRepo _generateStatisticsRepo;
  GenerateStatisticsCubit(this._generateStatisticsRepo)
      : super(GenerateStatisticsInitial());

  Future<void> generateStatistics({
    required String startDate,
    required String endDate,
    required String endPoint,
    required String token,
  }) async {
    emit(GenerateStatisticsLoadingState());
    var data = await _generateStatisticsRepo.generateStatistics(
      startDate: startDate,
      endDate: endDate,
      token: token,
      endPoint: endPoint,
    );
    data.fold((l) {
      emit(GenerateStatisticsFailureState(l.eerMessage));
    }, (r) {
      emit(GenerateStatisticsSuccessState(r));
    });
  }
}
