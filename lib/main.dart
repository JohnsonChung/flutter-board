// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_villains/villain.dart';
import 'board_model.dart';
import 'board_list.dart';
import 'page/board_view.dart';
import 'reply_model.dart';
import 'reply_list.dart';
import 'reply_card.dart';
import 'app_drawer.dart';
import 'app_route.dart';
import 'dog_card.dart';
import 'dog_detail.dart';
import 'dog_model.dart';
import 'utils/utils.dart';

void main() => runApp(MyApp());

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
        home: MyHomePage(title: 'ふたば（仮）'),
        // 想要把 setting的 function 切出去，亂寫的居然可以用 笑笑喔
        onGenerateRoute: (RouteSettings settings) => AppRoute.route(settings),
        initialRoute: '/',
        navigatorObservers: [new VillainTransitionObserver()],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Reply reply;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    /// Scaffold is the base for a page.
    /// It gives an AppBar for the top,
    /// Space for the main body, bottom navigation, and more.
    return Scaffold(
      /// App bar has a ton of functionality, but for now lets
      /// just give it a color and a title.
      key: _scaffoldkey,
      appBar: AppBar(
        /// Access this widgets properties with 'widget'
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.filter_none),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        actions: <Widget>[
          // Add 3 lines from here...
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _scaffoldkey.currentState.openEndDrawer()),
        ],
      ),

      /// Container is a convenience widget that lets us style it's
      /// children. It doesn't take up any space itself, so it
      /// can be used as a placeholder in your code.
      body: Container(
        color: const Color(0xFFFFFFEE),
        //child: ReplyList(initialReplies),
        child: BoardList(initialBoards),
      ),
      floatingActionButton:
          FloatingActionButton(
              onPressed: () {}, child: Icon(Icons.add)
          ),
      endDrawer: AppDrawer(),
    );
  }

  /***
   * DATA
   * ***/
  List<Board> initialBoards = []
    ..add(Board('Board Name', 'board_0.jpg', 000))
    ..add(Board('Board Name', 'board_1.jpg', 000))
    ..add(Board('Board Name', 'board_2.jpg', 000))
    ..add(Board('Board Name', 'board_3.jpg', 000))
    ..add(Board('Board Name', 'board_4.jpg', 000))
    ..add(Board('Board Name', 'board_5.jpg', 000))
    ..add(Board('Board Name', 'board_6.jpg', 000))
    ..add(Board('Board Name', 'board_7.jpg', 000))
    ..add(Board('Board Name', 'board_8.jpg', 000))
    ..add(Board('Board Name', 'board_9.jpg', 000));

  List<Reply> initialReplies = []
    ..add(Reply('No.123456', 'Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Reply('No.123441', 'Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Reply('No.123124', 'Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Reply('No.123456', 'Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Reply(
        'No.143446', 'Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'))
    ..add(Reply(
        'No.123456', 'Buddy', 'North sd Pole, Earth', 'Self proclaime asd d human lover.'))
    ..add(Reply('No.113536', 'Buddy', 'North Polas de, Earth',
        'Self proclaimas d sad as ed human lover.'))
    ..add(Reply('No.123434', 'Buddy', 'North Pole, Eas darth',
        'Self proclaias dmed human lover.'))
    ..add(Reply('No.123527', 'Buddy', 'North Pole, Eart da sh', 'Self proclas dasd aimed human lover.'));
}
