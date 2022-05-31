import 'package:flutter/material.dart';

import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/pages/main_page.dart';
import 'package:mpt_petitions/pages/registration_page.dart';
import 'package:mpt_petitions/services/navigation_service.dart';
import 'package:mpt_petitions/router.dart' as router;
import 'package:mpt_petitions/constants/route_path.dart' as routes;

void main() {
  runApp(const PetitionsApp());
}

class PetitionsApp extends StatelessWidget{

  static const String _title = 'МПТ Петиции';

  const PetitionsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService().navigatorKey,
      // onGenerateRoute: router.generateRoute,
      // initialRoute: routes.LoginRoute,

      // routes: {
      //   '/profile': (context) => Profile(),
      //   '/petition': (context) => Petitions(),
      //   '/password': (context) => Password(),
      //   '/create': (context) => const CreatePetition(),
      //   '/view': (context) => View_petition(),
      //   '/search': (context) => Search(),
      //   '/authorization': (context) => const AuthorizationPage(),
      //   '/registration': (context) =>const RegistrationPage(),
      //
      // },
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 125, 99, 1),
          backgroundColor: const Color.fromRGBO(250, 232, 221, 1),
          primaryColorDark: const Color.fromRGBO(4, 19, 165, 1),
          fontFamily: "Inter",
      ),
      home: const AuthorizationPage(),
    );
  }

}
