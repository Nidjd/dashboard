import 'package:equatable/equatable.dart';

import 'qr_code.dart';

class QrCodeModel extends Equatable {
	final String? message;
	final QrCode? qrCode;

	const QrCodeModel({this.message, this.qrCode});

	factory QrCodeModel.fromJson(Map<String, dynamic> json) => QrCodeModel(
				message: json['message'] as String?,
				qrCode: json['qr_code'] == null
						? null
						: QrCode.fromJson(json['qr_code'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'qr_code': qrCode?.toJson(),
			};

	@override
	List<Object?> get props => [message, qrCode];
}
