import 'dart:html';
import 'dart:js';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interfaces/update_password_interface.dart';
import '../../models/user_login_model.dart';
import '../../models/user_password_model.dart';
import '../../services/update_password_service.dart';
import 'Custom_Wigets.dart';




void main() {
  runApp(
    MaterialApp(
      initialRoute: '/password',
      routes: {
        '/password': (context) => Password(),
        '/profile': (context) => Profile(),


      },
    ),
  );
}

class Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool obscure2 = true;
  final _passwordController = TextEditingController();
  final _passwordRepidController = TextEditingController();
  final UpdatePassword _updatePassword = UpdatePasswordService();

  var HttpLog = ' https://mpt-petitions.ru/api/Login';
  final style = const ButtonStyle(
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [
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
                      padding: EdgeInsets.only(left:15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Profile()));                              },
                              style: style,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.account_circle,
                                    color: Color.fromARGB(255, 122,122,122),
                                  ),
                                  Text(
                                    'Профиль',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 74,73,73),
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
                                    Icons.key_rounded,
                                    color: Color.fromARGB(255, 52, 64, 180),
                                  ),
                                  Text(
                                    'Пароль',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 52, 64, 180),
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
                                Navigator.pushNamedAndRemoveUntil(context, '/petition', (route) => false);
                              },
                              style: style,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.article_rounded,
                                    color: Color.fromARGB(255, 122,122,122),
                                  ),
                                  Text(
                                    'Мои петиции',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 74,73,73),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 246, 244, 238),
                        width: 500,
                        height: double.infinity,
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            const SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Text("Сменить пароль",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                      color: Color.fromARGB(255, 4, 19, 165))),
                            ),

                            SizedBox(
                              height: 180,
                              width: 350,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        validator: (value)
                                      {
                                        if (value == "") return "Поле ввода не заполнено";
                                      },
                                        obscureText: obscure2,
                                        decoration:  InputDecoration(

                                            hintText: 'password',
                                            suffixIcon : IconButton(onPressed: ()
                                            {
                                              setState(() {
                                                if(obscure2 == true)
                                                {
                                                  obscure2 = false;

                                                }
                                                else
                                                {
                                                  obscure2 = true;
                                                }
                                              });
                                            },
                                              icon: Icon(obscure2 ? Icons.visibility_off_rounded : Icons.visibility_rounded), color: Color.fromARGB(255, 4,19,165),
                                              splashColor: Color.fromARGB(255,250,232,220),
                                              focusColor: Color.fromARGB(255,250,232,220),
                                              hoverColor: Color.fromARGB(255,250,232,220),),

                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),

                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,250,232,220), width: 0.0),

                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: 14.0, bottom: 0.0, top: 0.0),
                                            fillColor: Colors.white, filled: true
                                        ),
                                        style: TextStyle(fontSize: 13.0, color: Color.fromARGB(255,254,125,99),),

                                      ),
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: TextFormField(
                                        controller: _passwordRepidController,
                                        validator: (value)
                                      {
                                        if (value == "") return "Поле ввода не заполнено";
                                      },
                                        obscureText: obscure,
                                        decoration:  InputDecoration(

                                            hintText: 'password',
                                            suffixIcon : IconButton(onPressed: ()
                                            {
                                              setState(() {
                                                if(obscure == true)
                                                {
                                                  obscure = false;

                                                }
                                                else
                                                {
                                                  obscure = true;
                                                }
                                              });
                                            },
                                              icon: Icon(obscure ? Icons.visibility_off_rounded : Icons.visibility_rounded), color: Color.fromARGB(255, 4,19,165),
                                              splashColor: Color.fromARGB(255,250,232,220),
                                              focusColor: Color.fromARGB(255,250,232,220),
                                              hoverColor: Color.fromARGB(255,250,232,220),),

                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),

                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,250,232,220), width: 0.0),

                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: 14.0, bottom: 0.0, top: 0.0),
                                            fillColor: Colors.white, filled: true
                                        ),
                                        style: TextStyle(fontSize: 13.0, color: Color.fromARGB(255,254,125,99),),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 35,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Отправляю запрос")),
                                    );
                                    try {
                                      UserLoginModel? userLogin;
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.getString("token");


                                      PasswordModel? user = await _updatePassword.updatePassword(_passwordController.text, _passwordRepidController.text, prefs);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text("Изменение подтверждено!")));

                                    } catch (e) {
                                      print(e.toString());
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(e.toString())));
                                    }
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
                              height: 25,
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: TextButton(
                                onPressed: (){},
                                child: const Text("Отменить",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 4, 19, 165))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
