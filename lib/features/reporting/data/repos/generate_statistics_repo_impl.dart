import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/reporting/data/models/generate_statistics_model.dart';
import 'package:dashboard/features/reporting/data/repos/generate_statistics_repo.dart';
import 'package:dio/dio.dart';

class GenerateStatisticsRepoImpl implements GenerateStatisticsRepo {
  final ApiService _apiService;

  GenerateStatisticsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, GenerateStatisticsModel>> generateStatistics({
    required String startDate,
    required String endDate,
    required String token,
    required String endPoint,
  }) async {
    try {
      
        var data = await _apiService.postGenerateStatistics(
          endPoint: endPoint,
          startDate: startDate,
          endDate: endDate,
          token: token,
        );
      
      GenerateStatisticsModel generateStatisticsModel =
          GenerateStatisticsModel.fromJson(data);
      return right(generateStatisticsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
