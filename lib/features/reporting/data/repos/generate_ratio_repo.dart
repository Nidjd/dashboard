import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/reporting/data/models/generate_ratio_model.dart';

abstract class GenerateRatioRepo {
  Future<Either<Failure, GenerateRatioModel>> generateRatio({required String startMonth,required String endMonth,required String endPoint,required String token,});
}
