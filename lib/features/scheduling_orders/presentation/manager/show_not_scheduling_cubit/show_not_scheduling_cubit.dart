import 'package:bloc/bloc.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/show_not_schedulong/show_not_schedluing_repo.dart';
import 'package:dashboard/features/scheduling_orders/data/models/show_not_scheduling/show_not_scheduling_model.dart';
import 'package:equatable/equatable.dart';

part 'show_not_scheduling_state.dart';

class ShowNotSchedulingCubit extends Cubit<ShowNotSchedulingState> {
  final ShowNotSchedluingRepo showNotSchedluingRepo;
  ShowNotSchedulingCubit(this.showNotSchedluingRepo)
      : super(ShowNotSchedulingInitial());

  Future<void> showNotScheduling({
    required String token,
    required endPoint,
  }) async {
    emit(ShowNotSchedulingLoadingState());
    var data = await showNotSchedluingRepo.showNotScheduling(
      token: token,
      endPoint: endPoint,
    );
    data.fold((l) {
      emit(ShowNotSchedulingFailureState(l.eerMessage));
    }, (r) {
      emit(ShowNotSchedulingSuccessState(r));
    });
  }
}
