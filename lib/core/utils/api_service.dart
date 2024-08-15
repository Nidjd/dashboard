import 'dart:async';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as html;

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  // final String _baseUrl = 'http://10.0.2.2:8000/api/';
  final String _baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Map<String, dynamic>> postForLogin(
      {required String endPoint,
      required String email,
      required String password}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "email": email,
        "password": password,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> postForAddWorker({
    required String endPoint,
    required String name,
    required int id,
    required String token,
  }) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: {
          "name": name,
          "team_id": id,
        },
        options: Options(
          headers: {
            "Authorization": token,
          },
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> postElectronicDevice({
    required String endPoint,
    required String token,
    required String name,
    required int size,
    required String warning,
    required String notes,
    required String wayOfWork,
    required String warranteState,
    required String warantyDate,
    required XFile file,
  }) async {
    final Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    final html.FileReader reader = html.FileReader();

    reader.readAsArrayBuffer(html.File([await file.readAsBytes()], file.name));
    reader.onLoad.listen((event) async {
      if (reader.readyState == html.FileReader.DONE) {
        // تحويل Blob إلى MultipartFile
        final blob = reader.result as List<int>;
        MultipartFile multipartFile =
            MultipartFile.fromBytes(blob, filename: file.name);

        FormData formData = FormData.fromMap({
          "name": name,
          "size": size,
          "warning": warning,
          "notes": notes,
          "way_of_work": wayOfWork,
          "warranty_state": warranteState,
          "warranty_date": warantyDate,
          'photo': multipartFile,
        });

        final response = await _dio.post(
          '$_baseUrl$endPoint', // ضع هنا عنوان URL الخاص بخادمك المحلي
          data: formData,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          completer.complete(response.data);
        } else {
          completer
              .completeError("Failed to upload data: ${response.statusCode}");
        }
      }
    });
    reader.onError.listen((event) {
      completer.completeError("File reading error");
    });

    return completer.future;
  }

  Future<List<dynamic>> get({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": token},
      ),
    );

    return response.data;
  }

  Future<List<dynamic>> getTeams({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": token},
      ),
    );

    return response.data;
  }

  Future<dynamic> getWorkers({
    required String endPoint,
    required String token,
    required int teamId,
  }) async {
    var response2 = await _dio.get(
      '$_baseUrl$endPoint',
      data: {},
      queryParameters: {
        "team_id": teamId,
      },
      options: Options(
        headers: {"Authorization": token},
      ),
    );

    return response2.data;
  }

  Future<dynamic> deleteWorker(
      {required String endPoint,
      required int id,
      required String token}) async {
    var response = await _dio.delete(
      '$_baseUrl$endPoint',
      queryParameters: {
        "worker_id": id,
      },
      options: Options(
        headers: {
          "Authorization": token,
        },
        method: "DELETE",
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> postGenerateStatistics({
    required String endPoint,
    required String startDate,
    required String endDate,
    required String token,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: {"start_date": startDate, "end_date": endDate},
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "POST",
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> postGenerateRatio({
    required String startMonth,
    required String endMonth,
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: {
        "start_month": startMonth,
        "end_month": endMonth,
      },
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "POST",
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> showScheduling({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "GET",
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> updateRequestByAdmin({
    required String endPoint,
    required String token,
    required double salary,
    required int id,
    required String warrantyState,
  }) async {
   
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: {
        "id": id,
        "salary": salary,
        "warranty_state": warrantyState
      },
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "POST",
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> showNotScheduling({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "GET",
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> schedule({
    required String endPoint,
    required String token,
    required String startTime,
    required String endTime,
    required int id,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: {
        "start_time": startTime,
        "end_time": endTime,
        "requestId": id,
      },
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "POST",
      ),
    );

    return response.data;
  }

  Future<List<dynamic>> getReports({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "GET",
      ),
    );

    return response.data;
  }
}
