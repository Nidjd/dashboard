import 'package:equatable/equatable.dart';

class GenerateStatisticsModel extends Equatable {
	final int? totalRequests;
	final int? pendingRequests;
	final int? completedRequests;

	const GenerateStatisticsModel({
		this.totalRequests, 
		this.pendingRequests, 
		this.completedRequests, 
	});

	factory GenerateStatisticsModel.fromJson(Map<String, dynamic> json) {
		return GenerateStatisticsModel(
			totalRequests: json['total_requests'] as int?,
			pendingRequests: json['pending_requests'] as int?,
			completedRequests: json['completed_requests'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'total_requests': totalRequests,
				'pending_requests': pendingRequests,
				'completed_requests': completedRequests,
			};

	@override
	List<Object?> get props {
		return [
				totalRequests,
				pendingRequests,
				completedRequests,
		];
	}
}
