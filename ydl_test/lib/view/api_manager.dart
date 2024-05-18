import 'package:dio/dio.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();
  late Dio _dio;

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal() {
    _dio = Dio();
  }

  Future<Response> post(String url,
      {dynamic data, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.post(url,
          data: data,
          options: Options(headers: {
            "Authorization": "Fv14sMRkz8uYqd3VMbKy5RWMISnTooWGuC0bphwYN44="
          }));
    } catch (e) {
      rethrow;
    }
  }
}
