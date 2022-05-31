import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mpt_petitions/interfaces/update_user_interface.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'get_user_service.dart';

class UpdateUserService extends UpdateUser {
  Future<UserModel?> update(
    int id,
    String surname,
    String name,
    String email,
    PlatformFile? image,
    SharedPreferences token,
  ) async {
    //id = ID;
    const api = "https://mpt-petitions.ru/api/user-update";

    var data = FormData.fromMap({
      "surname": surname,
      "name": name,
      "email": email,
    });

    if (image != null) {
      var mFile = MultipartFile.fromBytes(image.bytes!, filename: image.name);
      data.files.add(MapEntry('image', mFile));
    }

    final dio = Dio();
    dio.options.headers
        .addAll({"Authorization": "Bearer ${token.getString("token")}"});
    var response = await dio.post(api, data: data);
    final body = response.data;
    print(response.data);
    if (response.statusCode == 200) {
      final body = response.data;
      if (body['message'] != 'unauthorized') {
        return UserModel.fromJson(body, token.getString("token"));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
