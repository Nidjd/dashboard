import 'package:equatable/equatable.dart';

import 'user.workers.dart';

class ShowWorkersModel extends Equatable {
	final int? id;
	final int? userId;
	final int? maintenanceTeamId;
	final User? user;

	const ShowWorkersModel({this.id, this.userId, this.maintenanceTeamId, this.user});

	factory ShowWorkersModel.fromJson(Map<String, dynamic> json) => ShowWorkersModel(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				maintenanceTeamId: json['maintenance_team_id'] as int?,
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'maintenance_team_id': maintenanceTeamId,
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props => [id, userId, maintenanceTeamId, user];
}
