import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/Statistics/data/reports_model/reports_model.dart';
import 'package:dashboard/features/Statistics/data/repos/get_reports_repo.dart';
import 'package:dio/dio.dart';

class GetReportsRepoImpl implements GetReportsRepo {
  final ApiService _apiService;

  GetReportsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ReportsModel>>> getReports(
      {required String token, required String endPoint}) async {
    try {
      var data = await _apiService.getReports(
        endPoint: endPoint,
        token: token,
      );
      List<ReportsModel> reports = [];

      for (var element in data) {
        reports.add(ReportsModel.fromJson(element));
      }
      
      return right(reports);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
