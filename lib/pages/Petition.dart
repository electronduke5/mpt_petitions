import 'package:flutter/material.dart';
import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/services/get_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/global.dart' as global;
import '../models/petition_model.dart';
import '../models/user_model.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/petition',
      routes: {
        '/petition': (context) => Petitions(),
        '/profile': (context) => Profile(),
        '/password': (context) => Password(),
        '/create': (context) => const CreatePetition(),
        '/view': (context) => View_petition(),
        '/search': (context) => Search(),
      },
    ),
  );
}

class Petitions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );

  var listPetition = global.getMyPetition();
  var user;
  final IGetUser _getUser = GetUserService();

  @override
  void initState() {
    super.initState();
    user = global.user;
    listPetition = global.getMyPetition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBar_widget(),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                color: Colors.white,
                width: 180,
                height: double.infinity,
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/profile', (route) => false);
                        },
                        style: style,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(255, 122, 122, 122),
                            ),
                            Text(
                              'Профиль',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 74, 73, 73),
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
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/password', (route) => false);
                        },
                        style: style,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.key_rounded,
                              color: Color.fromARGB(255, 122, 122, 122),
                            ),
                            Text(
                              'Пароль',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 74, 73, 73),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 22,
                    ),
                    TextButton(
                        onPressed: () {},
                        style: style,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.article_rounded,
                              color: Color.fromARGB(255, 52, 64, 180),
                            ),
                            Text(
                              'Мои петиции',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 52, 64, 180),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Container(
                      color: const Color.fromARGB(255, 246, 244, 238),
                      width: 500,
                      height: double.infinity,
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          const SizedBox(
                            height: 35,
                          ),
                          const SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: Text("Мои петиции",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0,
                                    color: Color.fromARGB(255, 4, 19, 165))),
                          ),
                          if (global.user.petitions == null)
                            const Text(
                              "Вы еще не создали ни одной петиции",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(4, 19, 165, 1)),
                            ),
                          FutureBuilder<List<PetitionModel>?>(
                            future: listPetition,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var petition = (snapshot.data
                                        as List<PetitionModel>)[index];

                                    return PetitionWidget(
                                      id: petition.id.toString(),
                                      name: petition.name,
                                      description: petition.description,
                                      created_at: petition.created_at,
                                      signatures: petition.signatures,
                                      pickedFile: petition.image,
                                      nameAuthor: global.user.name,
                                      surnameAuthor: global.user.surname,
                                      superStringCurrentWindow: "MyPetitions",
                                      onUpdateSelected: () async {
                                        user = await global.updateUser();

                                        setState(() {
                                          global.user = user;
                                          listPetition = global.getMyPetition();
                                        });
                                      },
                                      containerPetitionColor:
                                          const Color.fromARGB(
                                              255, 246, 244, 238),
                                      backgroundPetitionColor:
                                          const Color.fromRGBO(
                                              255, 253, 248, 1),
                                    );
                                  },
                                  itemCount:
                                      (snapshot.data as List<PetitionModel>)
                                          .length,
                                );
                              } else if (snapshot.hasError) {
                                print(
                                    "Error print My Petition: ${snapshot.hasError}");
                                return const CircularProgressIndicator();
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      )),
                ),
              ),
            ]))
      ]),
    );
  }
}
