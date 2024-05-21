import 'package:equatable/equatable.dart';

import 'worker.dart';

class WorkerInfo extends Equatable {
	final String? email;
	final String? password;
	final Worker? worker;

	const WorkerInfo({this.email, this.password, this.worker});

	factory WorkerInfo.fromJson(Map<String, dynamic> json) => WorkerInfo(
				email: json['email'] as String?,
				password: json['password'] as String?,
				worker: json['worker'] == null
						? null
						: Worker.fromJson(json['worker'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
				'worker': worker?.toJson(),
			};

	@override
	List<Object?> get props => [email, password, worker];
}
