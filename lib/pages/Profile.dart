import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import '../../constants/global.dart' as global;

import 'package:file_picker/file_picker.dart';
import 'dart:io';


void main() {
  runApp(
    MaterialApp(
      initialRoute: '/profile',
      routes: {
        '/profile': (context) => Profile(),
        '/petition': (context) => Petitions(),
        '/password': (context) => Password(),
        '/create': (context) => const CreatePetition(),
        '/view': (context) => View_petition(),
        '/search': (context) => Search(),

      },
    ),
  );
}

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {

  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  var HttpLog = ' https://mpt-petitions.ru/api/Login';
  FilePickerResult? result;
  String? _fileName;
  Uint8List? pickedFile;
  bool isLoading = false;
  File? _file;
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );
  void _pickFile() async{
 try{
  setState(() {
    isLoading = true;
  });
  result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
  );
  if(result != null)
    {
      _fileName = result!.files.first.name;
      pickedFile = result!.files.single.bytes;
      _file = File(pickedFile.toString());
      print('$_fileName');
    }
  setState(() {
    isLoading = false;
  });

}catch(e)
    {
      print(e);
    }
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          AppBar_widget(),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 180,
                    height: double.infinity,
                    padding: const EdgeInsets.only(left:15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: style,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.account_circle,
                                  color: Color.fromARGB(255, 52, 64, 180),
                                ),
                                Text(
                                  'Профиль',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 52, 64, 180),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              MaterialPageRoute(
                                  builder: (_) =>
                                      Password());
                              //Navigator.pushNamedAndRemoveUntil(context, '/password', (route) => false);
                            },
                            style: style,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.key_rounded,
                                  color: Color.fromARGB(255, 122,122,122),
                                ),
                                Text(
                                  'Пароль',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 74,73,73),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              print("You clicked in My petitions!");

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       Petitions()));
                              //Navigator.pushNamedAndRemoveUntil(context, '/petition', (route) => false);
                            },
                            style: style,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.article_rounded,
                                  color: Color.fromARGB(255, 122,122,122),
                                ),
                                Text(
                                  'Мои петиции',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 74,73,73),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 246, 244, 238),
                      width: 500,
                      height: double.infinity,
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            const SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Text("Редактировать профиль",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                      color: Color.fromARGB(255, 4, 19, 165))),
                            ),
                            if(pickedFile != null)
                              Flexible(
                                child: Container(
                                  height: 150,
                                  width: 250,
                                  padding: EdgeInsets.zero,
                                  decoration: const BoxDecoration(shape: BoxShape.circle),
                                  clipBehavior: Clip.hardEdge,
                                  child:

                                  Image(
                                    image: MemoryImage(pickedFile!),
                                  ),

                                ),
                              ),
                            if(pickedFile == null)
                              Container(
                                  height: 150,
                                  width: 250,
                                  padding: EdgeInsets.zero,
                                  decoration: const BoxDecoration(shape: BoxShape.circle),
                                  clipBehavior: Clip.hardEdge,
                                  child:

                                  const Icon(Icons.verified_user)
                              ),
                            const SizedBox(
                              height: 25,
                            ),


                            SizedBox(
                              height: 50,
                              width: 150,
                              child:  TextButton( onPressed: () {
                                _pickFile();
                              },
                                child: const Text("Загрузить фото",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 4, 19, 165))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 270,
                              width: 350,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: TextFormField(
                                        controller: TextEditingController(text: global.user.name),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Заполните поле ввода имени";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 250, 232, 220),
                                                width: 0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          hintText: 'Введите имя',

                                          contentPadding: EdgeInsets.only(
                                              left: 14.0, bottom: 0.0, top: 0.0),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          color:
                                          Color.fromARGB(255, 254, 125, 99),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: TextFormField(
                                        controller: TextEditingController(text: global.user.surname),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Заполните поле ввода фамилии";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 250, 232, 220),
                                                width: 0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          hintText: 'Введите фамилию',
                                          contentPadding: EdgeInsets.only(
                                              left: 14.0, bottom: 0.0, top: 0.0),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          color:
                                          Color.fromARGB(255, 254, 125, 99),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: TextFormField(
                                        controller: TextEditingController(text: global.user.email),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Заполните поле ввода почты";
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 250, 232, 220),
                                                width: 0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 254, 125, 99),
                                                width: 2.0),
                                          ),
                                          hintText: 'Введите почту  ',
                                          contentPadding: EdgeInsets.only(
                                              left: 14.0, bottom: 0.0, top: 0.0),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          color:
                                          Color.fromARGB(255, 254, 125, 99),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 35,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                            Text('Форма успешно сохранена')));
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: const Color.fromARGB(255, 52, 64, 180),
                                child: const Text(
                                  'Сохранить',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: TextButton(
                                onPressed: (){},
                                child: const Text("Отменить",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 4, 19, 165))),
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
