import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';

abstract class DeleteRequestRepo {
  Future<Either<Failure, String>> deleteRequest({
    required int id,
    required String token,
    required String endPoint,
  });
}
