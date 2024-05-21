import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/teams/teams.dart';
import 'package:dashboard/features/add_maintenance_worker/data/models/worker_info/worker_info.dart';

abstract class AddMaintenanceWorkerRepo {
  Future<Either<Failure, List<Teams>>> getTeams();
  Future<Either<Failure, WorkerInfo>> addWorker({required String name,required int id,});
}
