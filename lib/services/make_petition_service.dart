import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mpt_petitions/interfaces/make_petition_interface.dart';

import '../models/petition_model.dart';
import '../constants/global.dart' as global;

class MakePetitionService extends IMakePetition {
  @override
  Future<PetitionModel?> makePetition(
      String name, String description, PlatformFile image) async {
    try{
      const api = 'https://mpt-petitions.ru/api/make-petition';

      var mFile = MultipartFile.fromBytes(image.bytes!, filename: image.name);

      //var formData = FormData();
      //formData.files.add(MapEntry('image', mFile));
      var data = FormData.fromMap({"name": name, "description": description});
      data.files.add(MapEntry('image', mFile));

      final dio = Dio();
      dio.options.headers
          .addAll({"Authorization": "Bearer ${global.user.token}"});

      Response response = await dio.post(api, data: data);
      print("response: " + response.data.toString());
      print("responseCode: " + response.statusCode.toString());

      if (response.statusCode == 200) {
        final body = response.data;
        print("name: " + body["name"]);
        print("desc: " + body["description"]);
        print("body: " + body.toString());
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
    } on DioError catch (error){
      throw Exception(error);
    }

  }
}
