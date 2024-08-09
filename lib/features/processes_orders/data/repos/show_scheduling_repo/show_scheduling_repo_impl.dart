import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/processes_orders/data/repos/show_scheduling_repo/show_scheduling_repo.dart';
import 'package:dashboard/features/processes_orders/data/models/show_scheduling_model/show_scheduling_model.dart';
import 'package:dio/dio.dart';

class ShowSchedulingRepoImpl implements ShowSchedulingRepo {
  final ApiService _apiService;

  ShowSchedulingRepoImpl(this._apiService);

  @override
  Future<Either<Failure, ShowSchedulingModel>> showScheduling(
      {required String endPoint, required String token}) async {
    try {
      var data = await _apiService.showScheduling(
        endPoint: endPoint,
        token: token,
      );
      ShowSchedulingModel showSchedulingModel =
          ShowSchedulingModel.fromJson(data);
      return right(showSchedulingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
