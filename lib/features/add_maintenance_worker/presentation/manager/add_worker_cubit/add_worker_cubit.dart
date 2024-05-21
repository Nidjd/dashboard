import 'package:bloc/bloc.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/worker_info/worker_info.dart';
import 'package:dashboard/features/add_maintenance_worker/data/repos/add_maintenance_worker_repo.dart';
import 'package:equatable/equatable.dart';

part 'add_worker_state.dart';

class AddWorkerCubit extends Cubit<AddWorkerState> {
  final AddMaintenanceWorkerRepo _addMaintenanceWorkerRepo;
  AddWorkerCubit(this._addMaintenanceWorkerRepo) : super(AddWorkerInitial());

  Future<void> addNewWorker({
    required String name,
    required int id,
  }) async {
    emit(AddWorkerLoading());
    var data = await _addMaintenanceWorkerRepo.addWorker(name: name, id: id);
    data.fold((Failure f) {
      emit(AddWorkerFailure(f.eerMessage));
    }, (WorkerInfo w) {
      emit(AddWorkerSuccess(w));
    });
  }
}
