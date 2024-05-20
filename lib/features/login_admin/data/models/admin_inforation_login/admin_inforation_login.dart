import 'package:equatable/equatable.dart';

import 'user.dart';

class AdminInforationLogin extends Equatable {
	final User? user;
	final String? accessToken;

	const AdminInforationLogin({this.user, this.accessToken});

	factory AdminInforationLogin.fromJson(Map<String, dynamic> json) {
		return AdminInforationLogin(
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			accessToken: json['access_token'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
				'access_token': accessToken,
			};

	@override
	List<Object?> get props => [user, accessToken];
}
