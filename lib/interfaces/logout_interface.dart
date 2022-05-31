import 'package:dio/dio.dart';

abstract class ILogout {
  Future<bool> logout(String token) async {
    const api = "https://mpt-petitions.ru/api/logout";
    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer $token"});
    var response = await dio.post(api);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
