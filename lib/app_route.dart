import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'page/board_view.dart';
import 'package:flutter_villains/villain.dart';

class AppRoute {
  RouteSettings settings;

  AppRoute(this.settings);

  static route(settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
            child: BoardView() ,
            type: PageTransitionType.rightToLeft);
        break;
      case '/second':
        return PageTransition(
            child: BoardView(),
            type: PageTransitionType.rightToLeftWithFade);
        break;
    }
  }
}
