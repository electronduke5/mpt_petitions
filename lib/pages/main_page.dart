import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:mpt_petitions/interfaces/logout_interface.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/services/logout_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class MainPage extends StatefulWidget {
  final UserModel? user;
  const MainPage({Key? key, required this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  final ILogout _logoutService = LogoutService();

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: key,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              height: 90,
              child: AppBar_widget(),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  color: Theme.of(context).backgroundColor),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(45),
              child: Column(children: [
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "\nНаша команда реализовала уже 100 000 проектов\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.05,
                          color: Color.fromRGBO(4, 19, 165, 1),
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Вы можете внести свой вклад в развитие образования !\nПрисоединяйтесь прямо сейчас !\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(4, 19, 165, 1),
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const CreatePetition()));
                      },
                      child: const Text(
                        "Создать петицию",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 224, 217, 1),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            letterSpacing: 0.05,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.fromLTRB(15, 20, 15, 20)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "\n",
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
