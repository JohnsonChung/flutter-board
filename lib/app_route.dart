import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'page/board_view.dart';
import 'page/board_list_view.dart';
import 'page/board_setting_view.dart';
import 'package:basic_flutter_app/board_list.dart';
import 'package:flutter_villains/villain.dart';

class AppRoute {
  RouteSettings settings;

  AppRoute(this.settings);

  static route(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<void>(builder: (context) => BoardListView());
        break;
      case '/board_view':
        return MaterialPageRoute(
            builder: (context) => BoardView(settings.arguments));
        break;
      case '/board_setting_view':
        return MaterialPageRoute(
            builder: (context) => BoardSettingView());
        break;
    }
  }
}
