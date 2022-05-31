import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';

import '../constants/constants.dart';
import '../interfaces/get_petition_interface.dart';
import '../models/petition_model.dart';
import '../services/get_petition_service.dart';
import '../constants/constants.dart' as constants;

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/view',
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

class View_petition extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  String api = "https://mpt-petitions.ru/api/petitions/most-popular?page=1";
  final _formKey = GlobalKey<FormState>();
  var decor1 = TextDecoration.underline;
  var decor2 = TextDecoration.none;
  var decor3 = TextDecoration.none;
  final IGetPetition _getPetition = GetPetitionService();
  final IGetCountOfPetitions _getCountOfPetitions =
  GetCountOfPetitionsService();


  var listPetitions;
  var listButtons;

  @override
  void initState() {
    super.initState();
    listPetitions = _getPetition.getPetition(api);
    listButtons = _getCountOfPetitions.getCountOfPetitions(api);
  }

  bool obscure = true;
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            AppBar_widget(),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 1500,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 250, 232, 221),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        decor1 = TextDecoration.underline;
                        decor2 = TextDecoration.none;
                        decor3 = TextDecoration.none;
                        api =
                        'https://mpt-petitions.ru/api/petitions/most-popular?page=1';

                        listPetitions = _getPetition.getPetition(api);
                        listButtons = _getCountOfPetitions.getCountOfPetitions(api);
                      });
                    },
                    child: Text("Популярные",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.0,
                            decoration: decor1,
                            color: Color.fromARGB(255, 4, 19, 165))),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        decor1 = TextDecoration.none;
                        decor2 = TextDecoration.underline;
                        decor3 = TextDecoration.none;
                        api = 'https://mpt-petitions.ru/api/petitions/recent?page=1';

                        listPetitions = _getPetition.getPetition(api);
                        listButtons = _getCountOfPetitions.getCountOfPetitions(api);
                      });
                    },
                    child: Text("Последние",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.0,
                            decoration: decor2,
                            color: Color.fromARGB(255, 4, 19, 165))),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        decor1 = TextDecoration.none;
                        decor2 = TextDecoration.none;
                        decor3 = TextDecoration.underline;
                      });
                    },
                    child: Text("Завершённые",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.0,
                            decoration: decor3,
                            color: Color.fromARGB(255, 4, 19, 165))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            FutureBuilder<List<PetitionModel>>(
              future: listPetitions,
              builder: (context, snapshot) {
                print("Data: ${snapshot.data!.length}");
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var petition =
                          (snapshot.data as List<PetitionModel>)[index];
                          return Petition_widget(
                              id: petition.id.toString(),
                              pickedFile: petition.image,
                              name: petition.name,
                              description: petition.description,
                              created_at: petition.created_at,
                              signatures: petition.signatures.toString(),
                              nameAuthor: petition.nameAuthor.toString(),
                              surnameAuthor: petition.surnameAuthor.toString(),
                              superStringCurrentWindow: "ViewPetitions",
                              backgroundPetitionColor: ConstantValues.backgroundPetitionColor,
                              containerPetitionColor: ConstantValues.containerPetitionColor);
                        },
                        itemCount: (snapshot.data as List<PetitionModel>).length),
                  );
                } else {
                  print("Error: ${snapshot.error}");
                  return const CircularProgressIndicator();
                }
                // By default show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),

            const SizedBox(
              height: 40,
            ),

            FutureBuilder<CountOfPetitions>(
              future: listButtons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CountOfPetitions? buttons = snapshot.data;
                  if (buttons != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (buttons.currentPage != "1" && buttons.prevPageApi != null)
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  api = buttons.prevPageApi.toString();
                                  listPetitions = _getPetition.getPetition(api);
                                  listButtons =
                                      _getCountOfPetitions.getCountOfPetitions(api);
                                });
                              },
                              child: const Text('<',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 254, 125, 99)))),
                        Text(
                          buttons.currentPage + '/' + buttons.countOfPages,
                          style: const TextStyle(
                              fontSize: 36,
                              color: Color.fromRGBO(206, 206, 206, 1),
                              decoration: TextDecoration.none),
                        ),
                        if (buttons.currentPage != buttons.countOfPages &&
                            buttons.nextPageApi != null)
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  api = buttons.nextPageApi.toString();
                                  listPetitions = _getPetition.getPetition(api);
                                  listButtons =
                                      _getCountOfPetitions.getCountOfPetitions(api);
                                });
                              },
                              child: const Text('>',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Color.fromARGB(255, 254, 125, 99))))
                      ],
                    );
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                } else if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error}",
                    style: TextStyle(fontSize: 12),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 40,
            ),

          ]),
        ));
  }
}
