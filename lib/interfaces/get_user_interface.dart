import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IGetUser {
  Future<UserModel?> getUser(SharedPreferences token) async {
    const api = "https://mpt-petitions.ru/api/user";
    final dio = Dio();

    dio.options.headers
        .addAll({"Authorization": "Bearer ${token.getString("token")}"});
    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      final body = response.data;
      if (body['message'] != 'unauthorized') {
        return UserModel(
            id: body['user']['id'],
            email: body['user']['email'],
            name: body['user']['name'],
            surname: body['user']['surname'],
            image: body['user']['image'],
            token: token.getString("token"),
            petitions: body['user']['petitions']);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
