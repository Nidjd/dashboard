import 'package:bloc/bloc.dart';
import 'package:dashboard/features/processes_orders/data/models/update_request_by_admin_model/update_request_by_admin_model.dart';
import 'package:dashboard/features/processes_orders/data/repos/update_request_by_admin_repo/update_request_by_admin_repo.dart';
import 'package:equatable/equatable.dart';

part 'update_request_by_admin_state.dart';

class UpdateRequestByAdminCubit extends Cubit<UpdateRequestByAdminState> {
  final UpdateRequestByAdminRepo updateRequestByAdminRepo;
  UpdateRequestByAdminCubit(this.updateRequestByAdminRepo)
      : super(UpdateRequestByAdminInitial());

  Future<void> updateRequestByAdmin({
    required String token,
    required String endPoint,
    required int id,
    required double salary,
  }) async {
    emit(UpdateRequestByAdminLoadingState());
    var data = await updateRequestByAdminRepo.updateRequestByAdmin(
      token: token,
      endPoint: endPoint,
      id: id,
      salary: salary,
    );
    data.fold((l) {
      emit(UpdateRequestByAdminFailureState(l.eerMessage));
    }, (r) {
      emit(UpdateRequestByAdminSuccessState(r));
    });
  }
}
