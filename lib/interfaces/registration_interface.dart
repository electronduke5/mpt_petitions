import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/user_reg_model.dart';

abstract class IRegistration {
  Future<UserRegModel?> registration(String surname,String name, String email,
      String password) async {
    const api = 'https://mpt-petitions.ru/api/register';
    final data = {
      "surname": surname,
      "name": name,
      "email": email,
      "password": password
    };
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      return UserRegModel(surname: surname, name: name, email: email, password: password);
    }
    else {
      return null;
    }
  }
}