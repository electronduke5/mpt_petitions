import 'package:flutter/material.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';

void main() => runApp(const PetitionsApp());

class PetitionsApp extends StatelessWidget{
  static const String _title = 'МПТ Петиции';

  const PetitionsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
