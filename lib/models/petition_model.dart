import 'dart:convert' show base64Decode, latin1;
import 'dart:typed_data';

class PetitionModel {
  final String id;
  final String name;
  final String description;
  final String? image;
  final String user_id;
  final String created_at;
  final String signatures;
  final String nameAuthor;
  final String surnameAuthor;

  PetitionModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.user_id,
      required this.created_at,
      required this.signatures,
      required this.surnameAuthor,
      required this.nameAuthor});

  factory PetitionModel.fromJson(Map<String, dynamic> data) {
    final id = data['id'].toString();
    print('ID: $id');
    final name = data['name'] as String;
    print('name: $name');
    final description = data['description'] as String;
    print('description: $description');

    final Uint8List? base64;
    final String? image = data['image'];
    print('image1: $image');
    final String? imageResult;
    if (image != null) {
      base64 = base64Decode(image);

      imageResult = "https://${latin1.decoder.convert(base64).substring(27)}";
      print('imageResult: $imageResult');
    } else {
      imageResult = null;
    }
    final userId = data['user_id'].toString();
    print('userId: $userId');
    final created_at = data['created_at'] as String;
    print('created_at: $created_at');
    final signatures = data['signatures_count'].toString();
    print('signatures: $signatures');

    final nameAuthor = data['author']['name'].toString();
    final surnameAuthor = data['author']['surname'].toString();
    return PetitionModel(
        id: id,
        name: name,
        description: description,
        image: imageResult,
        user_id: userId,
        created_at: created_at,
        signatures: signatures,
        nameAuthor: nameAuthor,
        surnameAuthor: surnameAuthor);
  }
}

class CountOfPetitions {
  String countOfPages;
  String currentPage;
  String? prevPageApi;
  String? nextPageApi;

  CountOfPetitions(
      {required this.countOfPages,
        required this.currentPage,
        required this.prevPageApi,
        required this.nextPageApi});
}
