import 'package:dio/dio.dart';

abstract class IDeletePetition{
  Future<bool> deletePetition(int id) async{
    final dio = Dio();
    dio.options.baseUrl = "https://mpt-petitions.ru/api/delete-petition";
    Response response = await dio.post("/$id");
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }
}