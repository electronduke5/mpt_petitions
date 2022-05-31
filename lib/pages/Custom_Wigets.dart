import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpt_petitions/interfaces/delete_petition_interface.dart';
import 'package:mpt_petitions/interfaces/logout_interface.dart';
import 'package:mpt_petitions/interfaces/update_petition_interface.dart';
import 'package:mpt_petitions/models/petition_model.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/services/delete_petition_service.dart';
import 'package:mpt_petitions/services/logout_service.dart';
import 'package:mpt_petitions/services/sign_petition_service.dart';
import 'package:mpt_petitions/services/update_petition_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../constants/global.dart' as global;
import '../interfaces/get_user_interface.dart';
import '../interfaces/sign_petition_interface.dart';
import '../services/get_user_service.dart';
import '../services/sign_petition_service.dart';

class AppBar_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ILogout _logoutService = LogoutService();

    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 70,
        color: Color.fromRGBO(4, 19, 165, 0.75),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const CreatePetition()));
                          },
                          child: const Text(
                            "Создать",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                                letterSpacing: 0.05,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 192, 167, 1),
                                decoration: TextDecoration.none),
                          )),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => View_petition()));
                          },
                          child: const Text(
                            "Просмотр",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                                letterSpacing: 0.05,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 192, 167, 1),
                                decoration: TextDecoration.none),
                          ))
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset("web/icons/IconMPT.svg",
                                height: 70, width: 70),
                            const Text(
                              " МПТ ПЕТИЦИИ",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(243, 243, 243, 1),
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ))
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: SvgPicture.asset("web/icons/IconSearch.svg",
                            height: 30, width: 30),
                      ),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => Profile()));
                        },
                        child: SvgPicture.asset("web/icons/IconAccount.svg",
                            height: 30, width: 30))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          try {
                            var isLogout =
                                await _logoutService.logout(global.user.token!);

                            if (isLogout == true) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const AuthorizationPage()));
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: SvgPicture.asset("web/icons/IconLogout.svg",
                            height: 30, width: 30))
                  ],
                )
              ],
            ))
          ],
        ));
  }
}

int one = 0;
int two = 1;
int three = 2;

int one2 = 0;
int two2 = 1;
int three2 = 2;
List<Widget> petitionsMass = [];

class Petition_widget_massiv extends StatelessWidget {
  String name = '';
  String amount = '125';
  String author = 'Артём Ефремов';
  String content = '';
  var count = <int>[];

  Petition_widget_massiv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (petitionsMass.length >= 2) {
      return Column(children: [
        petitionsMass[one],
        const SizedBox(
          height: 35,
        ),
        petitionsMass[two]
      ]);
    } else {
      return Column(children: petitionsMass);
    }
  }
}

List<Widget> buttonsMass = [
  TextButton(
      onPressed: () {}, child: Text('1', style: TextStyle(fontSize: 12))),
];

class Button_massiv extends StatelessWidget {
  Button_massiv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonsMass.length == 3) {
      return Row(children: [
        buttonsMass[one2],
        buttonsMass[two2],
        buttonsMass[three2],
      ]);
    } else if (buttonsMass.length > 3) {
      return Row(children: [
        buttonsMass[one2],
        buttonsMass[two2],
        buttonsMass[three2],
        buttonsMass[buttonsMass.length.toInt() - 1],
        Text('...')
      ]);
    } else {
      return Row(children: buttonsMass);
    }
  }
}

class PetitionWidget extends StatefulWidget {
  final String id;
  final String name;
  final String description;
  final String created_at;
  final String signatures;
  final String? pickedFile;
  final String nameAuthor;
  final String surnameAuthor;
  final String superStringCurrentWindow;
  final Color backgroundPetitionColor;
  final Color containerPetitionColor;
  final VoidCallback onUpdateSelected;

  PetitionWidget(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.created_at,
      required this.signatures,
      required this.pickedFile,
      required this.nameAuthor,
      required this.surnameAuthor,
      required this.superStringCurrentWindow,
      required this.backgroundPetitionColor,
      required this.containerPetitionColor,
      required this.onUpdateSelected()})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FormPetitionState();
}

class FormPetitionState extends State<PetitionWidget> {
  bool isTextField = false;

  final IUpdatePetition _updatePetition = UpdatePetitionService();
  final IDeletePetition _deletePetition = DeletePetitionService();
  final IGetUser _getUser = GetUserService();

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

  var updateName;
  var updateDescription;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        height: 390,
        color: widget.containerPetitionColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 380,
              width: 900,
              decoration: BoxDecoration(
                borderRadius: ConstantValues.borderRadius_7,
                color: widget.backgroundPetitionColor,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isTextField == false)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: SizedBox(
                            width: 540,
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 4, 19, 165),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      if (isTextField == true)
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: widget.name),
                                textAlign: TextAlign.left,
                                validator: (value) {
                                  if (value == "") {
                                    return "Заполните поле ввода создания петиции";
                                  }
                                },
                                onChanged: (text) {
                                  updateName = text;
                                },
                                decoration: const InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 254, 125, 99),
                                        width: 2.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 254, 125, 99),
                                        width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 250, 232, 220),
                                        width: 0.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 254, 125, 99),
                                        width: 2.0),
                                  ),
                                  hintText: 'Введите название петиции',
                                  //contentPadding:
                                  // EdgeInsets.only(left: 14.0, bottom: 0.0, top: 0.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 254, 125, 99),
                                ),
                              )),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              (widget.surnameAuthor + " " + widget.nameAuthor)
                                  .toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wc,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              widget.signatures + ' человек',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 254, 125, 99),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isTextField == false)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: SizedBox(
                            width: 540,
                            child: Text(
                              widget.description,
                              textAlign: TextAlign.left,
                              maxLines: 8,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 4, 19, 165),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      if (isTextField)
                        SizedBox(
                            height: 120,
                            width: 300,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20.0),
                                child: TextFormField(
                                  onChanged: (text) {
                                    updateDescription = text;
                                  },
                                  maxLength: 500,
                                  minLines: 8,
                                  maxLines: 10,
                                  controller: TextEditingController(
                                      text: widget.description),
                                  decoration: const InputDecoration(
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
                                              255, 250, 232, 220),
                                          width: 2.0),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText:
                                        'Напишите содержание вашей петиции...',
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
                                ))),
                      if (widget.superStringCurrentWindow != "ViewPetitions" &&
                          isTextField == false)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isTextField = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          ConstantValues.borderRadius_7),
                                  primary:
                                      const Color.fromARGB(255, 52, 64, 180)),
                              child: const Text(
                                "Редактировать",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      if (isTextField == true)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isTextField = false;
                                });
                                PetitionModel? petitionModel =
                                    await _updatePetition.updatePetition(
                                        int.parse(widget.id),
                                        updateName,
                                        updateDescription,
                                        _file);

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString("token", global.user.token!);

                                global.user = (await _getUser.getUser(prefs))!;

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Петиция успешно обновлена!")));

                                widget.onUpdateSelected();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          ConstantValues.borderRadius_7),
                                  primary:
                                      const Color.fromARGB(255, 52, 64, 180)),
                              child: const Text(
                                "Сохранить",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      if (isTextField == false)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isTextField = false;
                                });

                                var isDeleted = await _deletePetition
                                    .deletePetition(int.parse(widget.id));
                                if (isDeleted) {
                                  global.updateUser();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Петиция удалена")),
                                  );

                                  widget.onUpdateSelected();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Ошибка при удалении петиции")),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          ConstantValues.borderRadius_7),
                                  primary:
                                      const Color.fromRGBO(254, 125, 99, 1)),
                              child: const Text(
                                "Удалить",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      if (isTextField == true)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isTextField = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          ConstantValues.borderRadius_7),
                                  primary:
                                      const Color.fromRGBO(254, 125, 99, 1)),
                              child: const Text(
                                "Отмена",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.pickedFile != null && isTextField == false)
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 30, top: 20, bottom: 20),
                            child: Image.network(
                              widget.pickedFile as String,
                              height: 250,
                              width: 250,
                            )),
                      if (isTextField == true)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 20,
                                width: 600,
                                child: Text("Загрузить фотографию",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color:
                                            Color.fromARGB(255, 4, 19, 165)))),
                            if (pickedFile != null)
                              SizedBox(
                                  height: 130,
                                  width: 160,
                                  child: Image(
                                    image: MemoryImage(pickedFile!),
                                    alignment: Alignment.topCenter,
                                  )),
                            if (pickedFile == null && isTextField == true)
                              const SizedBox(
                                  height: 130,
                                  width: 160,
                                  child: Icon(Icons.add_a_photo)),
                            if (isTextField == true)
                              const SizedBox(
                                height: 35,
                              ),
                            if (isTextField == true)
                              SizedBox(
                                width: 160,
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _pickFile();
                                  },
                                  //shape: RoundedRectangleBorder(
                                  //    borderRadius: BorderRadius.circular(5.0)),
                                  //color: const Color.fromARGB(255, 4, 19, 165),
                                  child: const Text(
                                    'Загрузить фотографию',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class Petition_widget_ViewPetitions extends StatefulWidget {
  final String id;
  final String name;
  final String description;
  final String created_at;
  final String signatures;
  final String? pickedFile;
  final String nameAuthor;
  final String surnameAuthor;
  final String superStringCurrentWindow;
  final Color backgroundPetitionColor;
  final VoidCallback onUpdateSelected;

  Petition_widget_ViewPetitions(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.created_at,
      required this.signatures,
      required this.pickedFile,
      required this.nameAuthor,
      required this.surnameAuthor,
      required this.superStringCurrentWindow,
      required this.backgroundPetitionColor,
      required this.onUpdateSelected()})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => Petition_widgetState();
}

class Petition_widgetState extends State<Petition_widget_ViewPetitions> {
  final ISign _postSign = SignService();

  //final IPetitionSigned _signed = PetitionSignedService();
  var sign;

  //bool petition_is_signed = false;

  @override
  void initState() {
    super.initState();
    //var signed = _signed.isSigned(
    //    'https://mpt-petitions.ru/api/petitions/${widget.id}/check-if-signed',
    //    user.token);

    //FutureBuilder<IsPetitionSigned>(
    //    future: signed,
    //    builder: (context, snapshot) {
    //      if (snapshot.hasData) {
    //        IsPetitionSigned? sign = snapshot.data;
    //        if (sign!.signed.toString() == 'false') {
    //          petition_is_signed = false;
    //        } else {
    //          petition_is_signed = true;
    //        }
    //      }
    //      return CircularProgressIndicator();
    //    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1000,
        height: 360,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 900,
              decoration: BoxDecoration(
                borderRadius: ConstantValues.borderRadius_7,
                color: widget.backgroundPetitionColor,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: SizedBox(
                          width: 540,
                          child: Text(
                            widget.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 4, 19, 165),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              (widget.surnameAuthor + " " + widget.nameAuthor)
                                  .toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wc,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              widget.signatures + ' человек',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 254, 125, 99),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: SizedBox(
                          width: 540,
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.left,
                            maxLines: 8,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 4, 19, 165),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      //if (widget.superStringCurrentWindow == 'ViewPetitions' &&
                      //    petition_is_signed)
                      //  Padding(
                      //    padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      //    child: Container(
                      //      width: 200,
                      //      child: const Text(
                      //        'Подписано',
                      //        textAlign: TextAlign.left,
                      //        style: TextStyle(
                      //          fontSize: 20,
                      //          color: Color.fromARGB(255, 254, 125, 99),
                      //        ),
                      //      ),
                      //    ),
                      //  ),
                      if (widget.superStringCurrentWindow == 'ViewPetitions')
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                sign = _postSign.sign(
                                    'https://mpt-petitions.ru/api/petitions/${widget.id}/sign',
                                    global.user.token);

                                //if (petition_is_signed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Успешное подписание петиции.")));
                                //} else {
                                //ScaffoldMessenger.of(context).showSnackBar(
                                //    const SnackBar(
                                //        content:
                                //            Text("Петиция уже подписана.")));
                                //}
                                widget.onUpdateSelected();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          ConstantValues.borderRadius_7),
                                  primary:
                                      const Color.fromARGB(255, 52, 64, 180)),
                              child: const Text(
                                "Подписаться",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.pickedFile != null)
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 30, top: 20, bottom: 20),
                            child: Image.network(
                              widget.pickedFile as String,
                              height: 250,
                              width: 250,
                            ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
