import 'package:bloc/bloc.dart';
import 'package:dashboard/features/processes_orders/data/repos/show_scheduling_repo/show_scheduling_repo.dart';
import 'package:dashboard/features/processes_orders/data/models/show_scheduling_model/show_scheduling_model.dart';
import 'package:equatable/equatable.dart';

part 'show_scheduling_state.dart';

class ShowSchedulingCubit extends Cubit<ShowSchedulingState> {
  final ShowSchedulingRepo showSchedulingRepo;
  ShowSchedulingCubit(this.showSchedulingRepo) : super(ShowSchedulingInitial());
  
  Future<void> showSceduling({
    required String endPoint,
    required String token,
  }) async {
    emit(ShowSchedulingLoadingState());
    var data = await showSchedulingRepo.showScheduling(
        endPoint: endPoint, token: token);
    data.fold((l) {
      emit(ShowSchedulingFailureState(l.eerMessage));
    }, (r) {
      emit(ShowSchedulingSuccessState(r));
    });
  }
}
