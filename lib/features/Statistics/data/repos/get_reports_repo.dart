import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/Statistics/data/reports_model/reports_model.dart';

abstract class GetReportsRepo {
  Future<Either<Failure, List<ReportsModel>>> getReports({required String token,required String endPoint,});
}
