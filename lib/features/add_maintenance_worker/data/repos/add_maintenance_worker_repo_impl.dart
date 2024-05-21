import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/teams/teams.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/worker_info/worker_info.dart';
import 'package:dashboard/features/add_maintenance_worker/data/repos/add_maintenance_worker_repo.dart';
import 'package:dio/dio.dart';

class AddMaintenanceWorkerRepoImpl implements AddMaintenanceWorkerRepo {
  final ApiService _apiService;

  AddMaintenanceWorkerRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<Teams>>> getTeams() async {
    try {
      final String token = prefs.getString('token')!;

      var response =
          await _apiService.get(endPoint: "showTeam", token: "Bearer $token");

      List<Teams> teams = [];
      for (var element in response) {
        teams.add(Teams.fromJson(element));
      }

      return right(teams);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, WorkerInfo>> addWorker(
      {required String name, required int id}) async {
    try {
      final String token = prefs.getString('token')!;

      var response = await _apiService.postForAddWorker(
        endPoint: "addWorker",
        name: name,
        id: id,
        token: "Bearer $token",
      );
      WorkerInfo? info;
      try {
         info = WorkerInfo.fromJson(response);
      } catch (e) {
        print(e.toString());
      }

      return right(info!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
