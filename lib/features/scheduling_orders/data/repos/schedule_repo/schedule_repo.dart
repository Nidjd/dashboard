import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/scheduling_orders/data/models/schedule_model/schedule_model.dart';

abstract class ScheduleRepo {
  Future<Either<Failure, ScheduleModel>> schedule({
    required String endPoint,
    required String token,
    required String startTime,
    required String endTime,
    required int id,
  });
}
