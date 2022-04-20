import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'МПТ Петиции';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 125, 99, 1),
          backgroundColor: const Color.fromRGBO(250, 232, 221, 1),
          primaryColorDark: const Color.fromRGBO(4, 19, 165, 1)),
      home: const MyRegistrationPage(),
    );
  }
}

class MyRegistrationPage extends StatefulWidget {
  const MyRegistrationPage({Key? key}) : super(key: key);

  @override
  State<MyRegistrationPage> createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyRegPageWidget());
  }
}

class MyRegPageWidget extends StatelessWidget {
  const MyRegPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscure = true;
  bool _isObscureRepeaded = true;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: key,
      child: SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              color: Theme.of(context).backgroundColor),
          alignment: Alignment.center,
          margin: const EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Зарегистрируйтесь",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(4, 19, 165, 1),
                        decoration: TextDecoration.none),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Станьте частью нашей команды!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(4, 19, 165, 1),
                        decoration: TextDecoration.none),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Введите почту',
                        fillColor: Color.fromRGBO(255, 253, 248, 1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 253, 248, 1),
                                width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(202, 201, 200, 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(254, 125, 99, 1),
                                width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Заполните поле ввода почты";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: TextFormField(
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: const Color.fromRGBO(254, 125, 99, 1),
                      style: const TextStyle(
                        color: Color.fromRGBO(254, 125, 99, 1),
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: 'Пароль',
                        fillColor: const Color.fromRGBO(255, 253, 248, 1),
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 253, 248, 1),
                                width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(202, 201, 200, 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(254, 125, 99, 1),
                                width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Заполните поле ввода пароля";
                        } else if (value.length < 6) {
                          return "Пароль должен быть больше 6 символов";
                        }
                        password = value;
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: TextFormField(
                      obscureText: _isObscureRepeaded,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: const Color.fromRGBO(254, 125, 99, 1),
                      style: const TextStyle(
                        color: Color.fromRGBO(254, 125, 99, 1),
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscureRepeaded = !_isObscureRepeaded;
                            });
                          },
                        ),
                        hintText: 'Повторите пароль',
                        fillColor: const Color.fromRGBO(255, 253, 248, 1),
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 253, 248, 1),
                                width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(202, 201, 200, 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 3.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Заполните поле ввода пароля";
                        } else if (value.length < 6) {
                          return "Пароль должен быть больше 6 символов";
                        } else if (value != password) {
                          return "Пароли не совпадают";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Зарегистрироваться",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 224, 217, 1),
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
            ],
          ),
        ),
      ),
    );
  }
}
