import 'package:equatable/equatable.dart';

class GenerateRatioModel extends Equatable {
	final String? startMonth;
	final String? endMonth;
	final int? requestsStartMonth;
	final int? requestsEndMonth;
	final String? ratio;

	const GenerateRatioModel({
		this.startMonth, 
		this.endMonth, 
		this.requestsStartMonth, 
		this.requestsEndMonth, 
		this.ratio, 
	});

	factory GenerateRatioModel.fromJson(Map<String, dynamic> json) {
		return GenerateRatioModel(
			startMonth: json['start_month'] as String?,
			endMonth: json['end_month'] as String?,
			requestsStartMonth: json['requests_start_month'] as int?,
			requestsEndMonth: json['requests_end_month'] as int?,
			ratio: json['ratio'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'start_month': startMonth,
				'end_month': endMonth,
				'requests_start_month': requestsStartMonth,
				'requests_end_month': requestsEndMonth,
				'ratio': ratio,
			};

	@override
	List<Object?> get props {
		return [
				startMonth,
				endMonth,
				requestsStartMonth,
				requestsEndMonth,
				ratio,
		];
	}
}
