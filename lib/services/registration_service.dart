import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/registration_interface.dart';
import '../models/user_reg_model.dart';

class RegistrationService extends IRegistration {
  @override
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
    print("Response: ${response.data}");
    print("Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return UserRegModel(surname: surname, name: name, email: email, password: password);
    }
    else {
      return null;
    }
  }
}
