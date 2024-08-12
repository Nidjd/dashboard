import 'package:equatable/equatable.dart';

class ShowTeamPageModel extends Equatable {
  final int? id;
  final String? teamName;
  final String? teamTitle;
  final int? currentWorkersCount;

  const ShowTeamPageModel({
    this.id,
    this.teamName,
    this.teamTitle,
    this.currentWorkersCount,
  });

  factory ShowTeamPageModel.fromJson(Map<String, dynamic> json) {
    return ShowTeamPageModel(
      id: json['id'] as int?,
      teamName: json['team_name'] as String?,
      teamTitle: json['title'] as String?,
      currentWorkersCount: json['current_workers_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'team_name': teamName,
        'current_workers_count': currentWorkersCount,
      };

  @override
  List<Object?> get props => [id, teamName, currentWorkersCount];
}
