import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class GetUserService extends IGetUser {
  @override
  Future<UserModel?> getUser(SharedPreferences token) async {
    const api = "https://mpt-petitions.ru/api/user";
    final dio = Dio();

    dio.options.headers
        .addAll({"Authorization": "Bearer ${token.getString("token")}"});
    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      final body = response.data;
      if (body['message'] != 'unauthorized') {
        return UserModel.fromJson(body, token.getString("token"));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
