import 'package:bloc/bloc.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/delete_request_repo/delete_request_repo.dart';
import 'package:equatable/equatable.dart';

part 'delete_request_state.dart';

class DeleteRequestCubit extends Cubit<DeleteRequestState> {
  final DeleteRequestRepo deleteRequestRepo;
  DeleteRequestCubit(this.deleteRequestRepo) : super(DeleteRequestInitial());

  Future<void> deleteRequest({
    required int id,
    required String token,
    required String endPoint,
  }) async {
    emit(DeleteRequestLoadingState());
    var data = await deleteRequestRepo.deleteRequest(
      id: id,
      token: token,
      endPoint: endPoint,
    );

    data.fold((l) {
      emit(DeleteRequestFailureState(l.eerMessage));
    }, (r) {
      emit(DeleteRequestSuccessState(r));
    });
  }
}
