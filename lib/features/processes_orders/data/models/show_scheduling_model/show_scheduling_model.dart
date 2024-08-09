import 'package:equatable/equatable.dart';

import 'message.dart';

class ShowSchedulingModel extends Equatable {
	final bool? success;
	final List<Message>? message;

	const ShowSchedulingModel({this.success, this.message});

	factory ShowSchedulingModel.fromJson(Map<String, dynamic> json) {
		return ShowSchedulingModel(
			success: json['success'] as bool?,
			message: (json['message'] as List<dynamic>?)
						?.map((e) => Message.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [success, message];
}
