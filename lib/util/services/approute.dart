

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/features/drawer/presentation/screens/Bin.dart';
import 'package:taskmanager/features/drawer/presentation/screens/tabpage.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {
      case Bin.id:
        return MaterialPageRoute(builder: (context) {
          return  const Bin();
        });
      case TabPage.id:
        return MaterialPageRoute(builder: (context) {
          return Tab();
        });
      default:
        return null;
    }
  }
}
