import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

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
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "name":name,
        "size":size,
        "warning":warning,
        "notes":notes,
        "way_of_work":wayOfWork,
        "warranty_state":warranteState,
        "warranty_date":warantyDate
      },
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    return response.data;
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
    // print(response.data);
    return response.data;
  }
}
