import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpt_petitions/main.dart';
import 'package:mpt_petitions/pages/main_page.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isObscureRepeated = true;

  late String password;

  @override
  Widget build(BuildContext context) {
    //PasswordBloc _bloc = BlocProvider.of<PasswordBloc>(context);
    //PasswordBloc _blocIcon = BlocProvider.of<PasswordBloc>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                color: Theme.of(context).backgroundColor),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(45.0),
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
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.w700,
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
                          fontSize: 20,
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(4, 19, 165, 1),
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                _loginField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 70,
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
                              color: _isObscure
                                  ? const Color.fromRGBO(202, 201, 200, 1)
                                  : Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                // // _bloc.add(currentMap["obscure"] == false
                                // //     ? PasswordEvent.password_show
                                // //     : PasswordEvent.password_hide);
                                //
                                // _bloc.add(PasswordEvent.password_hide);
                              });
                            },
                          ),
                          hintText: 'Пароль',
                          fillColor: const Color.fromRGBO(255, 253, 248, 1),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 250, 232, 220),
                                width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 254, 125, 99),
                                width: 2.0),
                          ),
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 201, 200, 1)),
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
                      height: 100,
                      width: 400,
                      child: TextFormField(
                        obscureText: _isObscureRepeated,
                        enableSuggestions: false,
                        autocorrect: false,
                        cursorColor: const Color.fromRGBO(254, 125, 99, 1),
                        style: const TextStyle(
                          color: Color.fromRGBO(254, 125, 99, 1),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscureRepeated
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _isObscureRepeated
                                  ? const Color.fromRGBO(202, 201, 200, 1)
                                  : Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscureRepeated = !_isObscureRepeated;
                              });
                            },
                          ),
                          hintText: 'Повторите пароль',
                          fillColor: const Color.fromRGBO(255, 253, 248, 1),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 250, 232, 220),
                                width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 254, 125, 99),
                                width: 2.0),
                          ),
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 201, 200, 1)),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Processing Data")),
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                        }
                      },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Уже есть аккаунт?",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Войти",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _loginField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
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
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 250, 232, 220), width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 254, 125, 99), width: 2.0),
              ),
              hintStyle: TextStyle(color: Color.fromRGBO(202, 201, 200, 1)),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Заполните поле ввода почты";
              }
              if (!value.contains("@")) {
                return "Неправильно введен адрес электронной почты";
              }
              if (!RegExp(r"^[a-z0-9_-]{1,}\.[a-z]{1,2}.[a-z]{1,}@mpt\.ru")
                  .hasMatch(value)) {
                return "Неправильно введен адрес электронной почты";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
