import 'package:equatable/equatable.dart';

class Teams extends Equatable {
	final int? id;
	final String? teamName;
	final int? currentWorkersCount;

	const Teams({this.id, this.teamName, this.currentWorkersCount});

	factory Teams.fromJson(Map<String, dynamic> json) => Teams(
				id: json['id'] as int?,
				teamName: json['team_name'] as String?,
				currentWorkersCount: json['current_workers_count'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'team_name': teamName,
				'current_workers_count': currentWorkersCount,
			};

	@override
	List<Object?> get props => [id, teamName, currentWorkersCount];
}
