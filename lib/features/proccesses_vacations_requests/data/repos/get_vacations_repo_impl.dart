import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/models/vacations_model/vacations_model.dart';
import 'package:dashboard/features/proccesses_vacations_requests/data/repos/get_vacations_repo.dart';
import 'package:dio/dio.dart';

class GetVacationsRepoImpl implements GetVacationsRepo {
  final ApiService _apiService;

  GetVacationsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<VacationsModel>>> getVacations(
      {required String token, required String endPoint}) async {
    try {
      var data =
          await _apiService.showhandlerequest(endPoint: endPoint, token: token);
      List<VacationsModel> vacations = [];
      for (var element in data) {
        vacations.add(VacationsModel.fromJson(element));
      }
      
      return right(vacations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
