import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/get_user_service.dart';

abstract class DeleteUser {
  Future delete(
    SharedPreferences token,
  ) async {
    const api = "https://mpt-petitions.ru/api/user-delete";
    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer ${token.getString("token")}"});
    var response = await dio.post(api);
    print(response.data);
  }
}
