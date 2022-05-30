import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpt_petitions/interfaces/logout_interface.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/services/logout_service.dart';
import 'package:mpt_petitions/services/navigation_service.dart';
import 'package:mpt_petitions/constants/route_path.dart' as routes;

Widget _headerWidget(BuildContext context, UserModel? user) {
  final ILogout _logoutService = LogoutService();
  return Row(
    children: <Widget>[
      Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) =>
                                  const CreatePetition()));
                        },
                        child: const Text(
                          "Создать",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Inter',
                              letterSpacing: 0.05,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 192, 167, 1),
                              decoration: TextDecoration.none),
                        )),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => View_petition()));
                        },
                        child: const Text(
                          "Просмотр",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Inter',
                              letterSpacing: 0.05,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 192, 167, 1),
                              decoration: TextDecoration.none),
                        ))
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset("web/icons/IconMPT.svg",
                              height: 70, width: 70),
                          const Text(
                            " МПТ ПЕТИЦИИ",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Inter',
                                letterSpacing: 0.05,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(243, 243, 243, 1),
                                decoration: TextDecoration.none),
                          )
                        ],
                      ))
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                          "web/icons/IconSearch.svg",
                          height: 30,
                          width: 30),
                    ),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) =>
                                    Profile()));
                      },
                      child: SvgPicture.asset(
                          "web/icons/IconAccount.svg",
                          height: 30,
                          width: 30))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async {
                        try {
                          if (_logoutService
                              .logout(user?.token) ==
                              true) {

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) =>
                                    const AuthorizationPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Ошибка при выходе из аккаунта")));
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: SvgPicture.asset(
                          "web/icons/IconLogout.svg",
                          height: 30,
                          width: 30))
                ],
              )
            ],
          ))
    ],
  );
}