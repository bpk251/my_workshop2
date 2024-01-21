import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "https://api.amiearth.com/"));

  dynamic get({required String path}) async {
    Response res = await dio.get(path);
    if (res.statusCode == 200) {
      return res.data['data'];
    }
    return null;
  }

  dynamic post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    Response res = await dio.post(path,data: body);
    if (res.statusCode == 200) {
      return res.data['data'];
    }
    return null;
  }

  dynamic put({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    Response res = await dio.put(path,data: body);
    if (res.statusCode == 200) {
      return res.data['data'];
    }
    return null;
  }

  dynamic delete({
    required String path,
  }) async {
    Response res = await dio.delete(path);
    if (res.statusCode == 200) {
      return res.data['data'];
    }
    return null;
  }
}
