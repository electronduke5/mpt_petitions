import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/delete_petition_interface.dart';
import 'package:mpt_petitions/interfaces/make_petition_interface.dart';
import 'package:mpt_petitions/interfaces/update_petition_interface.dart';

import '../models/petition_model.dart';
import '../constants/global.dart' as global;

class DeletePetitionService extends IDeletePetition{
  @override
  Future<bool> deletePetition(int id) async{
    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer ${global.user.token}"});
    dio.options.baseUrl = "https://mpt-petitions.ru/api/delete-petition";
    Response response = await dio.post("/$id");
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    }
    else {
      return false;
    }
  }
}