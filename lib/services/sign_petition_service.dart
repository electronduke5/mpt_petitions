import 'package:dio/dio.dart';
import 'package:mpt_petitions/interfaces/sign_petition_interface.dart';
import 'package:mpt_petitions/models/petition_model.dart';

class SignService extends ISign {
  @override
  Future<PetitionSign> sign(String api, String? token) async {
    final dio = Dio();

    dio.options.headers.addAll({"Authorization": "Bearer ${token}"});
    Response response;
    response = await dio.post(api);

    if (response.statusCode == 200) {
      final body = response.data;
      return PetitionSign(message: body['message']);
    } else {
      throw Exception('Failed to load petitions');
    }
  }
}

class PetitionSignedService extends IPetitionSigned {
  @override
  Future<bool> isSigned(String api, String? token) async {
    final dio = Dio();

    dio.options.headers.addAll({"Authorization": "Bearer $token"});
    Response response;
    response = await dio.post(api);

    if (response.statusCode == 200) {
      final body = response.data;
      if (IsPetitionSigned(signed: body['signed']).signed) {
        return true;
      }
    }
    return false;
  }
}
