import 'package:equatable/equatable.dart';

import 'message.dart';

class ShowNotSchedulingModel extends Equatable {
	final bool? success;
	final List<Message>? message;

	const ShowNotSchedulingModel({this.success, this.message});

	factory ShowNotSchedulingModel.fromJson(Map<String, dynamic> json) {
		return ShowNotSchedulingModel(
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
