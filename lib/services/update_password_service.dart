import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interfaces/update_password_interface.dart';
import '../../models/user_password_model.dart';
import '../../services/get_user_service.dart';

class UpdatePasswordService extends UpdatePassword {
  Future<PasswordModel?> updatePassword(
    String password,
    String repeat_password,
    SharedPreferences token,
  ) async {
    const api = "https://mpt-petitions.ru/api/change-password";
    final data = {
      "password": password,
      "repeat-password": repeat_password,
    };
    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer ${token.getString("token")}"});

    var response = await dio.post(api, data: data);
    print(response.data);
    return PasswordModel(password: password, repeat_password: repeat_password);
  }
}
