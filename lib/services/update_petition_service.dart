import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/make_petition_interface.dart';
import 'package:mpt_petitions/interfaces/update_petition_interface.dart';

import '../models/petition_model.dart';
import '../constants/global.dart' as global;

class UpdatePetitionService extends IUpdatePetition {
  @override
  Future<PetitionModel?> updatePetition(
      int id, String name, String description, Uint8List image) async {
    final data = {"name": name, "description": description, "image": image};

    final dio = Dio();
    dio.options.baseUrl = "https://mpt-petitions.ru/api/update-petition";
    Response response = await dio.post("/$id", data: data);
    if (response.statusCode == 200) {
      var body = response.data;
      return PetitionModel(
          id: body['id'],
          user_id: body['user_id'],
          name: name,
          description: description,
          signatures: "0",
          created_at: body['created_at'],
          image: body['image'],
          nameAuthor: global.user.name,
          surnameAuthor: global.user.surname);
    } else {
      return null;
    }
  }
}
