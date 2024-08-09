import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/processes_orders/data/models/show_scheduling_model/show_scheduling_model.dart';

abstract class ShowSchedulingRepo {
  Future<Either<Failure,ShowSchedulingModel>> showScheduling({required String endPoint,required String token});
}
