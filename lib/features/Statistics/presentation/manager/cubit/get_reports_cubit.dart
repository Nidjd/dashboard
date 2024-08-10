import 'package:bloc/bloc.dart';
import 'package:dashboard/features/Statistics/data/reports_model/reports_model.dart';
import 'package:dashboard/features/Statistics/data/repos/get_reports_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_reports_state.dart';

class GetReportsCubit extends Cubit<GetReportsState> {
  final GetReportsRepo _getReportsRepo;
  GetReportsCubit(this._getReportsRepo) : super(GetReportsInitial());

  Future<void> getReports({
    required String token,
    required String endPoint,
  }) async {
    emit(GetReportsLoadingState());
    var data = await _getReportsRepo.getReports(
      token: token,
      endPoint: endPoint,
    );

    data.fold((l) {
      emit(GetReportsFailureState(l.eerMessage));
    }, (r) {
      emit(GetReportsSuccessState(r));
    });
  }
}
