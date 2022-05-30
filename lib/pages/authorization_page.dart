import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mpt_petitions/interfaces/get_user_interface.dart';
import '../constants/global.dart' as global;


import 'package:mpt_petitions/models/user_login_model.dart';
import 'package:mpt_petitions/pages/registration_page.dart';
import 'package:mpt_petitions/services/get_user_service.dart';
import 'package:mpt_petitions/services/login_service.dart';
import 'package:mpt_petitions/services/navigation_service.dart';
import 'package:mpt_petitions/constants/route_path.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/login_interface.dart';
import '../models/user_model.dart';
import 'main_page.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<AuthorizationPage> {
  final _formKey = GlobalKey<FormState>();

  final ILogin _loginService = LoginService();
  final IGetUser _getUser = GetUserService();

  final NavigationService _navigationService = NavigationService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  alignment: Alignment.topCenter,
                  width: 280,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Войти в аккаунт",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              fontFamily: "Inter",
                              color: Color.fromARGB(255, 4, 19, 165))),
                      Text("Рады снова вас видеть !",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: "Inter",
                              color: Color.fromARGB(255, 4, 19, 165))),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == "") return "Поле ввода не заполнено";
                          },
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 250, 232, 220),
                                  width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  width: 2.0),
                            ),
                            hintText: 'login@mail.ru',
                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 0.0, top: 0.0),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: "Inter",
                            color: Color.fromARGB(255, 254, 125, 99),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == "") return "Поле ввода не заполнено";
                          },
                          obscureText: obscure,
                          decoration: InputDecoration(
                              hintText: 'password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (obscure == true) {
                                      obscure = false;
                                    } else {
                                      obscure = true;
                                    }
                                  });
                                },
                                icon: Icon(obscure
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded),
                                color: Color.fromARGB(255, 4, 19, 165),
                                splashColor: Color.fromARGB(255, 250, 232, 220),
                                focusColor: Color.fromARGB(255, 250, 232, 220),
                                hoverColor: Color.fromARGB(255, 250, 232, 220),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 254, 125, 99),
                                    width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 254, 125, 99),
                                    width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 250, 232, 220),
                                    width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 254, 125, 99),
                                    width: 2.0),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 14.0, bottom: 0.0, top: 0.0),
                              fillColor: Colors.white,
                              filled: true),
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 254, 125, 99),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 320,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text("Забыли пароль? ",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 4, 19, 165))),
                        Text("Восстановить пароль ",
                            style: TextStyle(
                                fontFamily: "Inter",
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 4, 19, 165))),
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 320,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                           // try {
                              UserLoginModel? userLogin =
                                  await _loginService.login(
                                      _emailController.text,
                                      _passwordController.text);

                              if (userLogin != null) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString("token", userLogin.token);

                                UserModel? user = await _getUser.getUser(prefs);



                                if (user != null) {
                                  global.user = user;
                                  print("User Petitions: ${global.user.petitions}");
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              MainPage(user: user)));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Ошибка при получении данных пользователя")),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Для входа в аккаунт необходимо подтвердить адрес эл. почты!")),
                                );
                              }
                            // } catch (e) {
                            //   print(e.toString());
                            //   print(e.runtimeType);
                            //
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text("Технические шоколадки =/")),
                            //   );
                            // }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          primary: const Color.fromARGB(255, 254, 125, 99),
                        ),
                        child: const Text(
                          'Войти в аккаунт',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Inter",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 320,
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Нет аккаунта? ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 4, 19, 165))),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()));
                          },
                          child: const Text(
                            "Зарегистрироваться",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(4, 19, 165, 1)),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
