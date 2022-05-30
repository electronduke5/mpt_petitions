import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpt_petitions/interfaces/logout_interface.dart';
import 'package:mpt_petitions/models/user_model.dart';
import 'package:mpt_petitions/pages/Create_Petition.dart';
import 'package:mpt_petitions/pages/Profile.dart';
import 'package:mpt_petitions/pages/View_petitions.dart';
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/services/logout_service.dart';

import '../constants/constants.dart';

class AppBar_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ILogout _logoutService = LogoutService();

    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 70,
        color: Color.fromRGBO(4, 19, 165, 0.75),
        child: Row(
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
                                    builder: (_) => const CreatePetition()));
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
                        child: SvgPicture.asset("web/icons/IconSearch.svg",
                            height: 30, width: 30),
                      ),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => Profile()));
                        },
                        child: SvgPicture.asset("web/icons/IconAccount.svg",
                            height: 30, width: 30))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          // try {
                          //   if (_logoutService
                          //       .logout(user?.token) ==
                          //       true) {
                          //
                          //     Navigator.of(context).pushReplacement(
                          //         MaterialPageRoute(
                          //             builder: (_) =>
                          //             const AuthorizationPage()));
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //         const SnackBar(
                          //             content: Text(
                          //                 "Ошибка при выходе из аккаунта")));
                          //   }
                          // } catch (e) {
                          //   print(e.toString());
                          // }
                        },
                        child: SvgPicture.asset("web/icons/IconLogout.svg",
                            height: 30, width: 30))
                  ],
                )
              ],
            ))
          ],
        ));
  }
}

int one = 0;
int two = 1;
int three = 2;

int one2 = 0;
int two2 = 1;
int three2 = 2;
List<Widget> petitionsMass = [];

class Petition_widget_massiv extends StatelessWidget {
  String name = '';
  String amount = '125';
  String author = 'Артём Ефремов';
  String content = '';
  var count = <int>[];

  Petition_widget_massiv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (petitionsMass.length >= 2) {
      return Column(children: [
        petitionsMass[one],
        const SizedBox(
          height: 35,
        ),
        petitionsMass[two]
      ]);
    } else {
      return Column(children: petitionsMass);
    }
  }
}

List<Widget> buttonsMass = [
  TextButton(
      onPressed: () {}, child: Text('1', style: TextStyle(fontSize: 12))),
];

class Button_massiv extends StatelessWidget {
  Button_massiv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonsMass.length == 3) {
      return Row(children: [
        buttonsMass[one2],
        buttonsMass[two2],
        buttonsMass[three2],
      ]);
    } else if (buttonsMass.length > 3) {
      return Row(children: [
        buttonsMass[one2],
        buttonsMass[two2],
        buttonsMass[three2],
        buttonsMass[buttonsMass.length.toInt() - 1],
        Text('...')
      ]);
    } else {
      return Row(children: buttonsMass);
    }
  }
}

class Petition_widget extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String created_at;
  final String signatures;
  final String? pickedFile;
  final String nameAuthor;
  final String surnameAuthor;

  Petition_widget(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.created_at,
      required this.signatures,
      required this.pickedFile,
      required this.nameAuthor,
      required this.surnameAuthor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        height: 300,
        color: const Color.fromARGB(255, 255, 255, 248),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 290,
              width: 900,
              decoration: const BoxDecoration(
                borderRadius: ConstantValues.borderRadius_7,
                color: Color.fromRGBO(235, 235, 235, 1),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Text(
                          name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 4, 19, 165),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            const Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                             Text(
                               (surnameAuthor + " " + nameAuthor).toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 254, 125, 99),
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wc,
                              color: Color.fromARGB(255, 254, 125, 99),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              signatures + ' человек',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 254, 125, 99),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Container(
                          width: 540,
                          child: Text(
                            description,
                            textAlign: TextAlign.left,
                            maxLines: 8,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 4, 19, 165),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (pickedFile != null)
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 30, top: 20, bottom: 20),
                            child: Image.network(
                              pickedFile as String,
                              height: 250,
                              width: 250,
                            ))
                      else
                        const Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: 30, top: 20, bottom: 20),
                            child: Icon(
                              Icons.broken_image,
                              size: 40,
                            ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
// Widget build(BuildContext context) {
//   return Container(
//       width: 1350,
//       height: 300,
//       color: Color.fromARGB(255, 255, 253, 248),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 20.0, top: 20.0),
//                 child: Text(
//                   name,
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color.fromARGB(255, 4, 19, 165),
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.0, top: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.account_circle,
//                       color: Color.fromARGB(255, 254, 125, 99),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Text(
//                       author,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 254, 125, 99),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.0, top: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.wc,
//                       color: Color.fromARGB(255, 254, 125, 99),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Text(
//                       amount + ' человек',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 254, 125, 99),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.0, top: 10.0),
//                 child: Container(
//                   width: 950,
//                   height: 160,
//                   child: Text(
//                     content,
//                     textAlign: TextAlign.left,
//                     maxLines: 8,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color.fromARGB(255, 4, 19, 165),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20, left: 10),
//             child:
//                 Image(image: MemoryImage(pickedFile!), height: 300, width: 290, ),
//           ),
//         ],
//       ));
// }
}
