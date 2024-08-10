import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/scheduling_orders/data/models/show_not_scheduling/show_not_scheduling_model.dart';

abstract class ShowNotSchedluingRepo {
  Future<Either<Failure, ShowNotSchedulingModel>> showNotScheduling({required String token,required String endPoint,});
}
