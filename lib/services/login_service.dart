import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/login_interface.dart';
import '../models/user_login_model.dart';

class LoginService extends ILogin{
  @override
  Future<UserLoginModel?> login(String email, String password) async{
    const api = "https://mpt-petitions.ru/api/login";
    final data ={
      "email": email,
      "password": password
    };
    final dio = Dio();

    var response = await dio.post(api, data:data);

    print("headers login: ${response.headers.toString()}");
    print("Code login: ${response.statusCode}");
    print("message login: ${response.statusMessage}");
    if(response.statusCode == 200){
      final body = response.data;
      return UserLoginModel(email: email, password: password, token: body['token']);
    }
    else {
      return null;
    }
  }
}