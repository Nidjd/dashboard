import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/show_teams/data/models/show%20workers%20model/show.workers.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/show_workers_repos.dart';
import 'package:dio/dio.dart';

class ShowWorkersRepoImpl implements ShowWorkersRepo {
  final ApiService _apiService;

  ShowWorkersRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ShowWorkersModel>>> showWorker(
      {required int teamId}) async {
    try {
      final String token = prefs.getString('token')!;
      
      var data = await _apiService.getWorkers(
        endPoint: "showWorker",
        token: "Bearer $token",
        teamId: teamId,
      );

      List<ShowWorkersModel> workers = [];

      for (var element in data) {
        workers.add(ShowWorkersModel.fromJson(element));
      }

      return right(workers);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
