import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mpt_petitions/models/petition_model.dart';
import '../constants/global.dart' as global;

abstract class IUpdatePetition {
  Future<PetitionModel?> updatePetition(
      int id, String name, String description, PlatformFile? image) async {


    var data = FormData.fromMap({"name": name, "description": description});

    if(image != null){
      var mFile = MultipartFile.fromBytes(image.bytes!, filename: image.name);
      data.files.add(MapEntry('image', mFile));
    }

    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer ${global.user.token}"});
    dio.options.baseUrl = "https://mpt-petitions.ru/api/update-petition";
    Response response = await dio.post("/$id", data: data);
    if (response.statusCode == 200) {
      var body = response.data;
      print("UPDATE PETITION: $body");
      return PetitionModel(
          id: body['id'].toString(),
          user_id: body['user_id'].toString(),
          name: name.toString(),
          description: description,
          signatures: body['signatures_count'].toString(),
          created_at: body['created_at'].toString(),
          image: body['image'].toString(),
          nameAuthor: global.user.name,
          surnameAuthor: global.user.surname);
    } else {
      return null;
    }
  }
}
