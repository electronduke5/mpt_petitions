import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255,250,232,220),
        body: MyForm(),
      ),
    )
  );
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}
class MyFormState extends State
{

  /*Column(
      children: <Widget>[
        TextFormField(validator: (value)
        {
          if (value == "") return "ujujuj";
        },),

        new SizedBox(height: 20.0),

        new RaisedButton(onPressed: () {
          if(_formKey.currentState!.validate()) Scaffold.of(context).showSnackBar(new SnackBar(content: Text('Форма усакшно заполненно')));
        }

        )],
    ),*/

  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
  return Container(
    child: Form(key: _formKey, child:
    Container(
      alignment: Alignment.topCenter,

      child:

      Column(
        children:
        [
          Container(
            padding:  EdgeInsets.only(top:50),
            alignment: Alignment.topCenter,
            width: 280,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("Войти в аккаунт",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25.0, color: Color.fromARGB(255, 4,19,165))),
                Text("Рады снова вас видеть !",
                    style: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 4,19,165))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  height: 90,
                  child: TextFormField(validator: (value)
                  {
                    if (value == "") return "Поле ввода не заполнено";
                  },
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                      ),


                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Color.fromARGB(255,250,232,220), width: 0.0),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                      ),
                      hintText: 'login@mail.ru',
                      contentPadding: EdgeInsets.only(
                          left: 14.0, bottom: 0.0, top: 0.0),
                      fillColor: Colors.white, filled: true,
                    ),

                    style:
                    TextStyle(fontSize: 13.0, color: Color.fromARGB(255,254,125,99),),

                  ),
                ),


                


                SizedBox(
                  height: 70,

                  child: TextFormField(validator: (value)
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
          Container(
            margin: const EdgeInsets.only(top:50),
            width: 320,
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  Text("Забыли пароль? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0, color: Color.fromARGB(255, 4,19,165))),
                  Text("Восстановить пароль ",
                      style: TextStyle( decoration: TextDecoration.underline ,
                          fontWeight:  FontWeight.bold, fontSize: 12.0, color: Color.fromARGB(255, 4,19,165))),

                ]),
          ),
          Container(
              margin: const EdgeInsets.only(top:10),
              width: 320,
              alignment: Alignment.center,
              child:
              SizedBox(
                width: 250,

                child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) Scaffold.of(context).showSnackBar(new SnackBar(content: Text('Форма усакшно заполненно')));
                    },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  color: Color.fromARGB(255,254,125,99),
                  child: Text('Войти в аккаунт', style: TextStyle(fontSize: 12, color: Colors.white,), ),
                ),
              )
          ),
          Container(
            margin: const EdgeInsets.only(top:50),
            width: 320,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  Text("Нет аккаунта? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0, color: Color.fromARGB(255, 4,19,165))),
                  SizedBox(
                    height:10 ,),
                  Text("Зарегистрироваться ",
                      style: TextStyle( decoration: TextDecoration.underline ,
                          fontWeight:  FontWeight.bold, fontSize: 15.0, color: Color.fromARGB(255, 4,19,165))),

                ]),
          ),
        ],
      ),
    ),

      ),
  );

  }
  }




class StatWidg extends StatelessWidget {
   StatWidg({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          home: Scaffold(
            backgroundColor: Color.fromARGB(255,250,232,220),

            body:
            Container(
              alignment: Alignment.topCenter,

              child:

              Column(
                children:
                [
                  Container(
                    padding:  EdgeInsets.only(top:50),
                    alignment: Alignment.topCenter,
                    width: 280,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Войти в аккаунт",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0, color: Color.fromARGB(255, 4,19,165))),
                        Text("Рады снова вас видеть !",
                            style: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 4,19,165))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:50),
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                            ),


                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Color.fromARGB(255,250,232,220), width: 0.0),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Color.fromARGB(255,254,125,99), width: 2.0),

                            ),
                            hintText: 'login@mail.ru',

                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 0.0, top: 0.0),
                            fillColor: Colors.white, filled: true,
                          ),
                          style:
                          TextStyle(fontSize: 13.0, color: Color.fromARGB(255,254,125,99),),
                        ),
                        SizedBox(

                          height: 30.0,

                        ),
                        TextField(
                          obscureText: true,

                          decoration: InputDecoration(
                              hintText: 'password',
                              suffixIcon : Icon(Icons.visibility_off_rounded, color: Colors.black, ),

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


                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:50),
                    width: 320,
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget> [
                          Text("Забыли пароль? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0, color: Color.fromARGB(255, 4,19,165))),
                          Text("Восстановить пароль ",
                              style: TextStyle( decoration: TextDecoration.underline ,
                                  fontWeight:  FontWeight.bold, fontSize: 12.0, color: Color.fromARGB(255, 4,19,165))),

                        ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top:10),
                      width: 320,
                      alignment: Alignment.center,
                      child:
                      SizedBox(
                        width: 250,

                        child: RaisedButton(
                          onPressed: (){},
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          color: Color.fromARGB(255,254,125,99),
                          child: Text('Войти в аккаунт', style: TextStyle(fontSize: 12, color: Colors.white,), ),
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:50),
                    width: 320,
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget> [
                          Text("Нет аккаунта? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0, color: Color.fromARGB(255, 4,19,165))),
                          SizedBox(
                            height:10 ,),
                          Text("Зарегистрироваться ",
                              style: TextStyle( decoration: TextDecoration.underline ,
                                  fontWeight:  FontWeight.bold, fontSize: 15.0, color: Color.fromARGB(255, 4,19,165))),

                        ]),
                  ),
                ],
              ),
            ),
            ),
        );
  }
}



