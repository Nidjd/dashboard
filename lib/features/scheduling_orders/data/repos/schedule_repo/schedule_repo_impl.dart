import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/scheduling_orders/data/models/schedule_model/schedule_model.dart';
import 'package:dashboard/features/scheduling_orders/data/repos/schedule_repo/schedule_repo.dart';
import 'package:dio/dio.dart';

class ScheduleRepoImpl implements ScheduleRepo {
  final ApiService _apiService;

  ScheduleRepoImpl(this._apiService);
  @override
  Future<Either<Failure, ScheduleModel>> schedule(
      {required String endPoint,
      required String token,
      required String startTime,
      required String endTime,
      required int id}) async {
    try {
      var data = await _apiService.schedule(
        endPoint: endPoint,
        token: token,
        startTime: startTime,
        endTime: endTime,
        id: id,
      );

      ScheduleModel scheduleModel = ScheduleModel.fromJson(data);
      return right(scheduleModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
