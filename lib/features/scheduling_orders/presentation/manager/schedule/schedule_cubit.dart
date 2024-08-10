import 'package:bloc/bloc.dart';
import 'package:dashboard/features/scheduling_orders/data/models/schedule_model/schedule_model.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/schedule_repo/schedule_repo.dart';
import 'package:equatable/equatable.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepo scheduleRepo;
  ScheduleCubit(this.scheduleRepo) : super(ScheduleInitial());

  Future<void> schedule({
    required String endPoint,
    required String token,
    required String startTime,
    required String endTime,
    required int id,
  }) async {
    emit(ScheduleLoadingState());
    var data = await scheduleRepo.schedule(
      endPoint: endPoint,
      token: token,
      startTime: startTime,
      endTime: endTime,
      id: id,
    );
    data.fold((l) {
      emit(ScheduleFailureState(l.eerMessage));
    }, (r) {
      emit(ScheduleSuccessState(r));
    });
  }
}
