import 'package:equatable/equatable.dart';

import 'team.dart';
import 'user.dart';

class Worker extends Equatable {
	final int? id;
	final int? userId;
	final int? maintenanceTeamId;
	final String? status;
	final Team? team;
	final User? user;

	const Worker({
		this.id, 
		this.userId, 
		this.maintenanceTeamId, 
		this.status, 
		this.team, 
		this.user, 
	});

	factory Worker.fromJson(Map<String, dynamic> json) => Worker(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				maintenanceTeamId: json['maintenance_team_id'] as int?,
				status: json['status'] as String?,
				team: json['team'] == null
						? null
						: Team.fromJson(json['team'] as Map<String, dynamic>),
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'maintenance_team_id': maintenanceTeamId,
				'status': status,
				'team': team?.toJson(),
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				maintenanceTeamId,
				status,
				team,
				user,
		];
	}
}
