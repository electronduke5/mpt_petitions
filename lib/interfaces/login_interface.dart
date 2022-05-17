import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/user_login_model.dart';

abstract class ILogin {
  Future<UserLoginModel?> login(String email, String password) async {
    const api = "https://mpt-petitions.ru/api/login";
    final data = {"email": email, "password": password};
    final dio = Dio();

    var response = await dio.post(api, data: data);

    if (response.statusCode == 200) {
      final body = response.data;
      return UserLoginModel(
          email: email, password: password, token: body['token']);
    } else {
      return null;
    }
  }
}
