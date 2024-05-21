import 'package:equatable/equatable.dart';

class Worker extends Equatable {
	final int? userId;
	final int? maintenanceTeamId;
	final int? id;

	const Worker({this.userId, this.maintenanceTeamId, this.id});

	factory Worker.fromJson(Map<String, dynamic> json) => Worker(
				userId: json['user_id'] as int?,
				maintenanceTeamId: json['maintenance_team_id'] as int?,
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'user_id': userId,
				'maintenance_team_id': maintenanceTeamId,
				'id': id,
			};

	@override
	List<Object?> get props => [userId, maintenanceTeamId, id];
}
