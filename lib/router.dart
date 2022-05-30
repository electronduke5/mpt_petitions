import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpt_petitions/constants/route_path.dart' as routes;
import 'package:mpt_petitions/pages/authorization_page.dart';
import 'package:mpt_petitions/pages/main_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => const AuthorizationPage());
    case routes.MainRoute:
      return MaterialPageRoute(builder: (context) => const MainPage(user: null));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
