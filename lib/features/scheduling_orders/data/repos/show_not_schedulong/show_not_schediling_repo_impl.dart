import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/show_not_schedulong/show_not_schedluing_repo.dart';
import 'package:dashboard/features/scheduling_orders/data/models/show_not_scheduling/show_not_scheduling_model.dart';
import 'package:dio/dio.dart';

class ShowNotSchedilingRepoImpl implements ShowNotSchedluingRepo {
  final ApiService _apiService;

  ShowNotSchedilingRepoImpl(this._apiService);

  @override
  Future<Either<Failure, ShowNotSchedulingModel>> showNotScheduling(
      {required String token, required String endPoint}) async {
    try {
      var data =
          await _apiService.showNotScheduling(endPoint: endPoint, token: token);
      ShowNotSchedulingModel showNotSchedulingModel =
          ShowNotSchedulingModel.fromJson(data);
      return right(showNotSchedulingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
