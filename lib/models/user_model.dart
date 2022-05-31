import 'package:mpt_petitions/models/petition_model.dart';

class UserModel{
  int id;
  String surname;
  String name;
  String email;
  String? token;
  List<PetitionModel>? petitions;

  UserModel({required this.id, required this.surname, required this.name, required this.email, required this.token, required this.petitions});

  factory UserModel.fromJson(Map<String, dynamic> data, String? token){
    final id = data['user']['id'] as int;
    final surname = data['user']['surname'] as String;
    final name = data['user']['name'] as String;
    final email = data['user']['email'] as String;
    print("Data['petition']: ${data['petitions']}");
    final petitionsData = data['petitions'] as List<dynamic>?;
    final petitions = petitionsData != null
        ? petitionsData.map((petitionsData) => PetitionModel.MyPetitionFromJson(petitionsData)).toList()
        : <PetitionModel>[];

    return UserModel(id: id, surname: surname, name: name, email: email, token: token, petitions: petitions);
  }
}