import 'package:bloc/bloc.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/delete_worker_repo.dart';
import 'package:equatable/equatable.dart';

part 'delete_worker_state.dart';

class DeleteWorkerCubit extends Cubit<DeleteWorkerState> {
  final DeleteWorkerRepo _deleteWorkerRepo;
  DeleteWorkerCubit(this._deleteWorkerRepo) : super(DeleteWorkerInitial());

  Future<void> deleteWorker({required int id}) async {
    emit(DeleteWorkerLoadingState());
    var data = await _deleteWorkerRepo.deleteWorker(id: id);
    data.fold(
      (l) {
        emit(DeleteWorkerFailureState(l.eerMessage));
      },
      (r) {
        emit(DeleteWorkerSuccessState(r));
      },
    );
  }
}
