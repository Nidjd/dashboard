import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final String _baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Map<String, dynamic>> post({required String endPoint,required String email,required String password}) async {
    var response = await _dio.post('$_baseUrl$endPoint',data: {
      "email":email,
      "password": password,
    },);
    return response.data;
  }
}
