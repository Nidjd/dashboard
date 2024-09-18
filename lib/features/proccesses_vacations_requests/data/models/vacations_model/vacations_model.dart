import 'package:equatable/equatable.dart';

import 'worker.dart';

class VacationsModel extends Equatable {
  final int? id;
  final int? workerId;
  final String? status;
  final String? reason;
  final String? endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Worker? worker;
  final String? type;
  final String? idApplication;

  const VacationsModel({
    this.id,
    this.workerId,
    this.status,
    this.reason,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.worker,
    this.type,
    this.idApplication
  });

  factory VacationsModel.fromJson(Map<String, dynamic> json) {
    return VacationsModel(
      id: json['id'] as int?,
      workerId: json['worker_id'] as int?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
      endDate: json['end_date'] as String?,
      type: json['type'],
      idApplication: json['idapplication'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      worker: json['worker'] == null
          ? null
          : Worker.fromJson(json['worker'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'worker_id': workerId,
        'status': status,
        'reason': reason,
        'end_date': endDate,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'worker': worker?.toJson(),
        'type': type,
        'idapplication':idApplication
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
      worker,
      type,
      idApplication
    ];
  }
}
