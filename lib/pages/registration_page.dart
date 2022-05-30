import 'package:flutter/material.dart';
import 'package:mpt_petitions/models/user_reg_model.dart';
import 'package:mpt_petitions/constants/constants.dart';
import '../services/registration_service.dart';
import '../interfaces/registration_interface.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final IRegistration _registrationService = RegistrationService();

  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  _surnameField(),
                  _nameField(),
                  _loginField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 400,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _passwordController,
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
                            } else if (value.length < 8) {
                              return "Пароль должен быть больше 8 символов";
                            }
                            else if(!RegExp(r'^(?=.*[a-z]).+$').hasMatch(value)){
                              return "В пароле должна присутствовать хотя бы одна строчная буква";
                            }
                            else if(!RegExp(r'^(?=.*[A-Z]).+$').hasMatch(value)){
                              return "В пароле должна присутствовать хотя бы одна заглавная буква";
                            }
                            else if(!RegExp(r'^(?=.*[1-9]).+$').hasMatch(value)){
                              return "В пароле должна присутствовать хотя бы одна цифра";
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
                          textInputAction: TextInputAction.done,
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
                            } else if (value.length < 8) {
                              return "Пароль должен быть больше 8 символов";
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Отправляю запрос")),
                            );
                            try {
                              UserRegModel? user =
                                  await _registrationService.registration(
                                      _surnameController.text,
                                      _nameController.text,
                                      _emailController.text,
                                      _passwordController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                      content: Text("На почту " + _emailController.text + " отправлено сообщение с подтвеждением")));

                            } catch (e) {
                              print(e.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
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

  Widget _surnameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 400,
          child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: ConstantValues.primaryColor,
              controller: _surnameController,
              style: const TextStyle(
                color: ConstantValues.primaryColor,
              ),
              decoration: const InputDecoration(
                hintText: "Фамилия",
                fillColor: ConstantValues.fieldFillColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: ConstantValues.borderRadius_7,
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 250, 232, 220), width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: ConstantValues.borderRadius_7,
                  borderSide: BorderSide(
                      color: ConstantValues.primaryColor, width: 2.0),
                ),
                hintStyle: TextStyle(color: ConstantValues.hintColor),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Заполните поле ввода фамилии";
                }
                return null;
              }),
        ),
      ],
    );
  }

  Widget _nameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 400,
          child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: ConstantValues.primaryColor,
              controller: _nameController,
              style: const TextStyle(
                color: ConstantValues.primaryColor,
              ),
              decoration: const InputDecoration(
                hintText: "Имя",
                fillColor: ConstantValues.fieldFillColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: ConstantValues.borderRadius_7,
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 250, 232, 220), width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: ConstantValues.borderRadius_7,
                  borderSide: BorderSide(
                      color: ConstantValues.primaryColor, width: 2.0),
                ),
                hintStyle: TextStyle(color: ConstantValues.hintColor),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Заполните поле ввода имени";
                }
                return null;
              }),
        ),
      ],
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
            controller: _emailController,
            textInputAction: TextInputAction.next,
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
