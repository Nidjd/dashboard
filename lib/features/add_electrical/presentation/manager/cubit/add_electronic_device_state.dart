part of 'add_electronic_device_cubit.dart';

sealed class AddElectronicDeviceState extends Equatable {
  const AddElectronicDeviceState();

  @override
  List<Object> get props => [];
}

final class AddElectronicDeviceInitial extends AddElectronicDeviceState {}

final class AddElectronicDeviceFailure extends AddElectronicDeviceState {
  final String errMessage;

  const AddElectronicDeviceFailure(this.errMessage);
}

final class AddElectronicDeviceSuccess extends AddElectronicDeviceState {
 final QrCodeModel qrCodeModel;

  const AddElectronicDeviceSuccess(this.qrCodeModel);
}

final class AddElectronicDeviceLoading extends AddElectronicDeviceState {}
