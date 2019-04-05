// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villain.dart';
import 'package:basic_flutter_app/model/board_model.dart';
import 'board_list.dart';
import 'page/board_view.dart';
import 'page/board_list_view.dart';
import 'package:basic_flutter_app/model/reply_model.dart';
import 'reply_list.dart';
import 'reply_card.dart';
import 'app_route.dart';
import 'utils/utils.dart';
import 'state_container.dart';

/// Run App with StateContainer
void main() => runApp(StateContainer(child: new MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Lock Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
        title: 'We Rate Dogs',
        // Make all our text default to white
        // and backgrounds default to dark
        theme: ThemeData(
          primaryColor: const Color(0xFF800000),
          accentColor: const Color(0xFF800000),
          brightness: Brightness.light,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFF800000),
                displayColor: Colors.pink,
              ),
        ),
        home: BoardListView(title: 'ふたば（仮）'),
        // 想要把 setting的 function 切出去，亂寫的居然可以用 笑笑喔
        onGenerateRoute: (RouteSettings settings) => AppRoute.route(settings),
        initialRoute: '/',
        navigatorObservers: [new VillainTransitionObserver()],
    );
  }
}