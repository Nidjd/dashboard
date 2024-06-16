import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/delete_worker_repo.dart';
import 'package:dio/dio.dart';

class DeleteWorkerRepoImpl implements DeleteWorkerRepo {
  final ApiService _apiService;

  DeleteWorkerRepoImpl(this._apiService);
  @override
  Future<Either<Failure, String>> deleteWorker({
    required int id,
  }) async {
    try {
      final String token = prefs.getString('token')!;
      var data = await _apiService.deleteWorker(
        endPoint: "deleteWorker",
        id: id,
        token: "Bearer $token",
      );
      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
