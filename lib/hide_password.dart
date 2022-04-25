import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PasswordEvent { password_hide, password_show }

class PasswordBloc extends Bloc<PasswordEvent, Map> {
  PasswordBloc()
      : super({
          "color": const Color.fromRGBO(202, 201, 200, 1),
          "icon": Icons.visibility_off,
          "obscure": true
        });

  PasswordEvent get event2 => PasswordEvent.password_hide;

  Color _color = const Color.fromRGBO(202, 201, 200, 1);
  IconData _icon = Icons.visibility_off;
  bool _isObscure = true;



  //PasswordEvent swap() {
    // return _event = (_event == PasswordEvent.password_hide ? PasswordEvent.password_show : PasswordEvent.password_hide);
  //}

  Stream<Map> mapEventToState(PasswordEvent event) async* {
    if (event == PasswordEvent.password_hide) {
      _color = const Color.fromRGBO(202, 201, 200, 1);
      _icon = Icons.visibility;
      _isObscure = true;
    } else {
      _color = const Color.fromRGBO(4, 19, 165, 1);
      _icon = Icons.visibility_off;
      _isObscure = false;
    }

    var asd = {"color": _color, "icon": _icon, "obscure": _isObscure};
    yield asd;
  }
}

class PasswordIcon extends Bloc<PasswordEvent, IconData> {
  PasswordIcon() : super(Icons.visibility_off);

  IconData _icon = Icons.visibility_off;

  IconData get initialState => Icons.visibility_off;

  Stream<IconData> mapEventToState(PasswordEvent event) async* {
    _icon = (event == PasswordEvent.password_hide
        ? Icons.visibility
        : Icons.visibility_off);

    yield _icon;
  }
}
