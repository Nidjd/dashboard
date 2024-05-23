import 'package:equatable/equatable.dart';

class QrCode extends Equatable {
	final String? qrBase64;
	final int? electricalPartId;
	final int? id;

	const QrCode({this.qrBase64, this.electricalPartId, this.id});

	factory QrCode.fromJson(Map<String, dynamic> json) => QrCode(
				qrBase64: json['QR_base64'] as String?,
				electricalPartId: json['electrical_part_id'] as int?,
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'QR_base64': qrBase64,
				'electrical_part_id': electricalPartId,
				'id': id,
			};

	@override
	List<Object?> get props => [qrBase64, electricalPartId, id];
}
