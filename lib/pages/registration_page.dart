import 'package:flutter/material.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpt_petitions/main.dart';
import 'package:mpt_petitions/pages/main_page.dart';
import 'package:mpt_petitions/constants.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: ConstantValues.borderRadius_7,
          color: ConstantValues.backgroundColor,
        ),
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: ConstantValues.borderRadius_7,
                  color: Theme.of(context).backgroundColor),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                            color: ConstantValues.secondaryColor,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                            color: ConstantValues.secondaryColor,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                          cursorColor: ConstantValues.primaryColor,
                          style: const TextStyle(
                            color: ConstantValues.primaryColor,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _isObscure
                                    ? const Color.fromRGBO(202, 201, 200, 1)
                                    : ConstantValues.secondaryColor,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 250, 232, 220),
                                  width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: ConstantValues.borderRadius_7,
                              borderSide: BorderSide(
                                  color: ConstantValues.primaryColor,
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
                          cursorColor: ConstantValues.primaryColor,
                          style: const TextStyle(
                            color: ConstantValues.primaryColor,
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
                              borderRadius: ConstantValues.borderRadius_7,
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 250, 232, 220),
                                  width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: ConstantValues.borderRadius_7,
                              borderSide: BorderSide(
                                  color: ConstantValues.primaryColor,
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

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
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
                              ConstantValues.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Уже есть аккаунт?",
                        style: TextStyle(
                          color: ConstantValues.secondaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Войти",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ConstantValues.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            cursorColor: ConstantValues.primaryColor,
            style: const TextStyle(
              color: ConstantValues.primaryColor,
            ),
            decoration: const InputDecoration(
              hintText: 'Введите почту',
              fillColor: ConstantValues.fieldFillColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: ConstantValues.borderRadius_7,
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 250, 232, 220), width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: ConstantValues.borderRadius_7,
                borderSide:
                    BorderSide(color: ConstantValues.primaryColor, width: 2.0),
              ),
              hintStyle: TextStyle(color: ConstantValues.hintColor),
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
