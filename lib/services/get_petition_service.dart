import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mpt_petitions/models/petition_model.dart';
import '../interfaces/get_petition_interface.dart';

class GetPetitionService extends IGetPetition {
  @override
  Future<List<PetitionModel>> getPetition(String api) async {
    final dio = Dio();

    Response response = await dio.get(api);
    if (response.statusCode == 200) {
      var getPetitionData = response.data['data'] as List;
      print('${getPetitionData[0]}');
      print('${getPetitionData[0]['name']}');
      print('Length: ${getPetitionData.length}');



      var listPetition =
          getPetitionData.map((petition) => PetitionModel.fromJson(petition)).toList();
      print("List Count: " + listPetition.length.toString());
      return listPetition;
    } else {
      throw Exception('Failed to load petitions');
    }
  }
}

class GetCountOfPetitionsService extends IGetCountOfPetitions {
  @override
  Future<CountOfPetitions> getCountOfPetitions(String api) async {
    final dio = Dio();

    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      final body = response.data;
      return CountOfPetitions(
          countOfPages: body['last_page'].toString(),
          currentPage: body['current_page'].toString(),
          prevPageApi: body['prev_page_url'],
          nextPageApi: body['next_page_url']);
    } else {
      throw Exception('Failed to load petitions');
    }
  }
}