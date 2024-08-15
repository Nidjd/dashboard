import 'package:bloc/bloc.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/vacations_model/vacations_model.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/get_vacations_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_vacations_state.dart';

class GetVacationsCubit extends Cubit<GetVacationsState> {
  final GetVacationsRepo getVacationsRepo;
  GetVacationsCubit(this.getVacationsRepo) : super(GetVacationsInitial());
  Future<void> getVacations(
      {required String token, required String endPoint}) async {
    emit(GetVacationsLoadingState());
    var data = await getVacationsRepo.getVacations(
      token: token,
      endPoint: endPoint,
    );
    data.fold((l) {
      emit(GetVacationsFailureState(l.eerMessage));
    }, (r) {
      emit(GetVacationsSuccessState(r));
    });
  }
}
