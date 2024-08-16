import 'package:equatable/equatable.dart';

class Data extends Equatable {
	final int? id;
	final int? workerId;
	final String? status;
	final String? reason;
	final String? endDate;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Data({
		this.id, 
		this.workerId, 
		this.status, 
		this.reason, 
		this.endDate, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				workerId: json['worker_id'] as int?,
				status: json['status'] as String?,
				reason: json['reason'] as String?,
				endDate: json['end_date'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'worker_id': workerId,
				'status': status,
				'reason': reason,
				'end_date': endDate,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				workerId,
				status,
				reason,
				endDate,
				createdAt,
				updatedAt,
		];
	}
}
