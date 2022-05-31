import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import '../interfaces/logout_interface.dart';

class LogoutService extends ILogout{
  @override
  Future<bool> logout(String token) async {
    const api = "https://mpt-petitions.ru/api/logout";
    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer $token"});

    var response = await dio.post(api);

    if (response.statusCode == 200) {
      print("message: ${response.data}");
      return true;
    } else {
      return false;
    }
  }
}