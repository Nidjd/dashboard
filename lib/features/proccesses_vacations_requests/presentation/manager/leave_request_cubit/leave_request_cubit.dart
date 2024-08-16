import 'package:bloc/bloc.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/leave_request_model/leave_request_model.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/leave_request_repo/leave_request_repo.dart';
import 'package:equatable/equatable.dart';

part 'leave_request_state.dart';

class LeaveRequestCubit extends Cubit<LeaveRequestState> {
  final LeaveRequestRepo leaveRequestRepo;
  LeaveRequestCubit(this.leaveRequestRepo) : super(LeaveRequestInitial());

  Future<void> leaveRequest({
    required String token,
    required String endPoint,
    required int id,
    required String status,
  }) async {
    emit(LeaveRequestLoadingState());
    var data = await leaveRequestRepo.leaveRequest(
      token: token,
      endPoint: endPoint,
      id: id,
      status:  status,
    );
    data.fold((l) {
      emit(LeaveRequestFailureState(l.eerMessage));
    }, (r) {
      emit(LeaveRequestSuccsessState(r));
    });
  }
}
