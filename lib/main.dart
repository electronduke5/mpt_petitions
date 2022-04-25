import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'МПТ Петиции';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 125, 99, 1),
          backgroundColor: const Color.fromRGBO(250, 232, 221, 1),
          primaryColorDark: const Color.fromRGBO(4, 19, 165, 1)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();

  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _MyHomePage extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHPageWidget());
  }
}

class MyHPageWidget extends StatelessWidget {
  const MyHPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      //key: key,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 90,
              color: const Color.fromRGBO(4, 19, 165, 0.75),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                              onPressed: () {},
                              child: const Text(
                                "Вход",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(255, 192, 167, 1),
                                    decoration: TextDecoration.none),
                              ))
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  color: Theme.of(context).backgroundColor),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(45),
              child: Column(children: [
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "\nНаша команда реализовала уже 100 000 проектов\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.05,
                          color: Color.fromRGBO(4, 19, 165, 1),
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Вы можете внести свой вклад в развитие образования !\nПрисоединяйтесь прямо сейчас !\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(4, 19, 165, 1),
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Создать петицию",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 224, 217, 1),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            letterSpacing: 0.05,
                            fontWeight: FontWeight.w800,
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
                  children: const [
                    Text(
                      "\n",
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
