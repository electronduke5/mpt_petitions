import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import 'package:mpt_petitions/models/petition_model.dart';
import 'package:mpt_petitions/services/get_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

UserModel user = UserModel(
    surname: "test",
    name: "name",
    email: "email",
    token: "token",
    image: null,
    id: -1,
    petitions: null);

Future<List<PetitionModel>?> getMyPetition() async {
  return user.petitions?.toList();
}

IGetUser _getUser = GetUserService();

Future<UserModel> updateUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", user.token!);

  user = (await _getUser.getUser(prefs))!;

  print("MyPetition count: ${user.petitions!.length}");
  return user;
}

Future<List<PetitionModel>?> getUpdatePetitions(
    PetitionModel updatePetition) async {
  int? pet = user.petitions
      ?.indexWhere((petition) => petition.id == updatePetition.id);
  user.petitions?.removeAt(pet!);
  user.petitions?.add(updatePetition);
  return user.petitions?.toList();
}
