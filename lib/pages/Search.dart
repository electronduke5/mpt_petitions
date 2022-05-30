import 'package:flutter/material.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';


void main() {
  runApp(
    MaterialApp(
      initialRoute: '/search',
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
class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}
class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color.fromARGB(255, 250, 232, 221),
            child: Column(children: [
              AppBar_widget(),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    width: 600,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value == "")
                            return "Заполните поле ввода имени";
                        },
                        decoration:  InputDecoration(
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
                          hintText: 'Поиск петиции...',
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
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: SizedBox(
                      width: 80,
                      height: 40,
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
                        color: const Color.fromARGB(255, 255,142,106),
                        child: const Text(
                          'Поиск',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ])));
  }
}
