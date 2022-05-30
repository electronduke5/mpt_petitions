import 'package:flutter/material.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';

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
  var HttpLog = ' https://mpt-petitions.ru/api/Login';
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );
  final Petition_name_1 = 'Петиция 1';
  final Petition_name_2 = 'Петиция 2';
  final Petition_amount_1 = '2365';
  final Petition_amount_2 = '1863';
  final content =
      'Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы, Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  Море инфы,  ';
  final author_1 = 'Артём Ефремов';
  final author_2 = 'Большой Серега';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
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
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                        /*Petition_widget(
                          name: Petition_name_1,
                          amount: Petition_amount_1,
                          content: content,
                          author: author_1,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Petition_widget(
                          name: Petition_name_2,
                          amount: Petition_amount_2,
                          content: content,
                          author: author_2,
                        ),*/
                        Petition_widget_massiv(),
                        SizedBox(
                          height: 65,
                          width: 250,
                          child: Button_massiv(),
                        ),
                        SizedBox(
                          width: 250,
                          height: 35,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                one = 3;
                                two = 4;
                              });

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
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                          width: 100,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Отменить",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 4, 19, 165))),
                          ),
                        ),
                      ])),
                ),
              )
            ])))
      ])),
    );
  }
}
