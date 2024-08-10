import 'package:equatable/equatable.dart';

class ScheduleModel extends Equatable {
	final bool? success;
	final String? message;

	const ScheduleModel({this.success, this.message});

	factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
				success: json['success'] as bool?,
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
			};

	@override
	List<Object?> get props => [success, message];
}
