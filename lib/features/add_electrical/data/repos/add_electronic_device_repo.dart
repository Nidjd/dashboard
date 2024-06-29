



import 'package:dartz/dartz.dart';
import 'package:dashboard/core/errors/failures.dart';
import 'package:dashboard/features/add_electrical/data/models/qr_code_model/qr_code_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddElectronicDeviceRepo {
  Future<Either<Failure, QrCodeModel>> addElectronicDevice({
    required String endPoint,
    required String token,
    required String name,
    required int size,
    required String warning,
    required String notes,
    required String wayOfWork,
    required String warranteState,
    required String warantyDate,
    required XFile file,
  });
}
