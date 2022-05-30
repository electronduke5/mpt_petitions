import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import 'package:mpt_petitions/models/petition_model.dart';
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
        //TODO Проверить работоспособность добавления петиций дпнного пользователя

        // final list = <PetitionModel>[
        //   PetitionModel(
        //       id: body['user']['petitions'][0]['id'] as int,
        //       name: body['user']['petitions'][0]['name'] as String,
        //       description: body['user']['petitions'][0]['description'] as String,
        //       image: Uint8List.fromList(body['user']['petitions'][0]['image']),
        //       user_id: int.parse(body['user']['petitions'][0]['user_id']))
        // ];

        // print("list:${list.toString()}");
        // print("Name: ${list[0].name}");
        // print('Description: ${list[0].description}');

        return UserModel.fromJson(body['user'], token.getString("token"));

        // return UserModel(
        //     id: body['user']['id'],
        //     email: body['user']['email'],
        //     name: body['user']['name'],
        //     surname: body['user']['surname'],
        //     token: token.getString("token"),
        //     petitions: body['user']['petitions'].toList());
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
