import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';

abstract class DeleteWorkerRepo {
  Future<Either<Failure, String>> deleteWorker({required int id});
}
