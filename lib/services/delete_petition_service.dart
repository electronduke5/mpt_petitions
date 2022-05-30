import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/delete_petition_interface.dart';
import 'package:mpt_petitions/interfaces/make_petition_interface.dart';
import 'package:mpt_petitions/interfaces/update_petition_interface.dart';

import '../models/petition_model.dart';

class DeletePetitionService extends IDeletePetition{
  @override
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