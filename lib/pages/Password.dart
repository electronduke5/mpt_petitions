import 'dart:html';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Custom_Wigets.dart';
import 'package:mpt_petitions/pages/Password.dart';
import 'package:mpt_petitions/pages/Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/Search.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';





void main() {
  runApp(
    MaterialApp(
      initialRoute: '/password',
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

class Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool obscure2 = true;
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
                                Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
                              },
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
                                    '??????????????',
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
                                    '????????????',
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
                                    '?????? ??????????????',
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
                              child: Text("?????????????? ????????????",
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
                                      child: TextFormField(validator: (value)
                                {
                                if (value == "") return "???????? ?????????? ???? ??????????????????";
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
                                      child: TextFormField(validator: (value)
                                      {
                                        if (value == "") return "???????? ?????????? ???? ??????????????????";
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
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                            Text('?????????? ?????????????? ??????????????????')));
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: const Color.fromARGB(255, 52, 64, 180),
                                child: const Text(
                                  '??????????????????',
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
                                child: const Text("????????????????",
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
