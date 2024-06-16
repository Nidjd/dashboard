import "package:dartz/dartz.dart";
import "package:dashboard/core/errors/failures.dart";
import "package:dashboard/features/show_teams/data/models/show%20workers%20model/show.workers.dart";

abstract class ShowWorkersRepo {
  Future<Either<Failure, List<ShowWorkersModel>>> showWorker({required int teamId});
}
