import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/reporting/data/models/generate_ratio_model.dart';
import 'package:dashboard/features/reporting/data/repos/generate_ratio_repo.dart';
import 'package:dio/dio.dart';

class GenerateRatioRepoImpl implements GenerateRatioRepo {
  final ApiService _apiService;

  GenerateRatioRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GenerateRatioModel>> generateRatio(
      {required String startMonth,
      required String endMonth,
      required String endPoint,
      required String token}) async {
    try {
      var data = await _apiService.postGenerateRatio(
        startMonth: startMonth,
        endMonth: endMonth,
        endPoint: endPoint,
        token: token,
      );

      GenerateRatioModel generateRatioModel = GenerateRatioModel.fromJson(data);
      return right(generateRatioModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
