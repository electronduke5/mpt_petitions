import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mpt_petitions/constants/constants.dart';
import 'package:mpt_petitions/interfaces/make_petition_interface.dart';
import 'package:mpt_petitions/models/petition_model.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/services/make_petition_service.dart';
import '../constants/global.dart' as global;

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/create',
      routes: {
        '/password': (context) => Password(),
        '/profile': (context) => Profile(),
        '/petition': (context) => Petitions(),
        '/create': (context) => const CreatePetition(),
        '/view': (context) => View_petition(),
        '/search': (context) => Search(),
      },
    ),
  );
}

class CreatePetition extends StatefulWidget {
  // final UserModel? user;
  // const CreatePetition({Key? key, required this.user}) : super(key: key);
  const CreatePetition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  final IMakePetition _makePetition = MakePetitionService();
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );

  FilePickerResult? result;
  String? _fileName;
  Uint8List? pickedFile;
  bool isLoading = false;
  var _file;

  void _pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePickerWeb.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        print("$_fileName");
        pickedFile = result!.files.single.bytes;
        _file = result?.files.single;
        print('${_file!.path}');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  var name;
  var content;
  var count = 0;
  var count_for_button = 1;

  List<Widget> buttonsMass2 = [
    TextButton(
        onPressed: () {}, child: Text('1', style: TextStyle(fontSize: 12))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 250, 232, 221),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppBar_widget(),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Text("Создать петицию",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: Color.fromARGB(255, 4, 19, 165))),
                ),
                SizedBox(
                  height: 90,
                  width: 350,
                  child: TextFormField(
                    validator: (value) {
                      if (value == "") {
                        return "Заполните поле ввода создания петиции";
                      }
                    },
                    onChanged: (text) {
                      name = text;
                    },
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 254, 125, 99),
                            width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 254, 125, 99),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 250, 232, 220),
                            width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 254, 125, 99),
                            width: 2.0),
                      ),
                      hintText: 'Введите название петиции',
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 0.0, top: 0.0),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Color.fromARGB(255, 254, 125, 99),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Text("Описать проблему",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 4, 19, 165))),
                ),
                const SizedBox(
                  height: 60,
                  width: 300,
                  child: Text(
                      "Расскажите людям о вашей проблеме и поясните почему она вам не безразлична.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 4, 19, 165))),
                ),
                SizedBox(
                  height: 200,
                  width: 800,
                  child: TextFormField(
                    onChanged: (text) {
                      content = text;
                    },
                    maxLength: 500,
                    minLines: 10,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 250, 232, 220),
                            width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 250, 232, 220),
                            width: 2.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Напишите содержание вашей петиции...',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Text("Загрузить фотографию",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 4, 19, 165))),
                ),
                const SizedBox(
                  height: 60,
                  width: 320,
                  child: Text(
                      "Прикрепите подходящую картинку для привлечения большего количества людей.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 4, 19, 165))),
                ),
                if (pickedFile != null)
                  SizedBox(
                      height: 130,
                      width: 160,
                      child: Image(
                        image: MemoryImage(pickedFile!),
                        alignment: Alignment.topCenter,
                      )),
                if (pickedFile == null)
                  const SizedBox(
                      height: 130, width: 160, child: Icon(Icons.add_a_photo)),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 160,
                  height: 35,
                  child: RaisedButton(
                    onPressed: () {
                      _pickFile();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: const Color.fromARGB(255, 254, 125, 99),
                    child: const Text(
                      'Загрузить фотографию',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          PetitionModel? petitionModel = await _makePetition
                              .makePetition(name, content, _file);
                          print("name: ");
                          print(petitionModel?.name);
                          print("description: ");
                          print(petitionModel?.description);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Петиция успешно добавлена!")));
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: const Color.fromARGB(255, 52, 64, 180),
                    child: const Text(
                      'Создать',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
