import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/reporting/data/models/generate_statistics_model.dart';

abstract class GenerateStatisticsRepo {
  Future<Either<Failure, GenerateStatisticsModel>> generateStatistics({
    required String startDate,
    required String endDate,
    required String token,
    required String endPoint,
  });
}
