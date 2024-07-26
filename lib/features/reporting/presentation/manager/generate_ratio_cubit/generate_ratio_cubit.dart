import 'package:bloc/bloc.dart';
import 'package:dashboard/features/reporting/data/models/generate_ratio_model.dart';
import 'package:dashboard/features/reporting/data/repos/generate_ratio_repo.dart';
import 'package:equatable/equatable.dart';

part 'generate_ratio_state.dart';

class GenerateRatioCubit extends Cubit<GenerateRatioState> {
  final GenerateRatioRepo generateRatioRepo;
  GenerateRatioCubit(this.generateRatioRepo) : super(GenerateRatioInitial());

  Future<void> generateRatio({
    required String startMonth,
    required String endMonth,
    required String endPoint,
    required String token,
  }) async {
    emit(GenerateRatioLoadingState());
    var data = await generateRatioRepo.generateRatio(
      startMonth: startMonth,
      endMonth: endMonth,
      endPoint: endPoint,
      token: token,
    );
    data.fold((l) {
      emit(GenerateRatioFailureState(l.toString()));
    }, (r) {
      emit(GenerateRatioSuccessState(r));
    });
  }
}
