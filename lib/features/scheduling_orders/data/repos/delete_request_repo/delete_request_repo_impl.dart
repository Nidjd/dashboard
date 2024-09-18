import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/delete_request_repo/delete_request_repo.dart';
import 'package:dio/dio.dart';

class DeleteRequestRepoImpl implements DeleteRequestRepo {
  final ApiService _apiService;

  DeleteRequestRepoImpl(this._apiService);
  @override
  Future<Either<Failure, String>> deleteRequest({
    required int id,
    required String token,
    required String endPoint,
  }) async {
    try {
      var data = await _apiService.deleteRequest(
        token: token,
        endPoint: endPoint,
        id: id,
      );

      String message = data;
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
