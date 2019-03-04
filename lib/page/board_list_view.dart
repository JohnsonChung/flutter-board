import 'package:flutter/material.dart';
import '../board_list.dart';
import '../board_model.dart';
import '../app_drawer.dart';

class BoardListView extends StatefulWidget {
  BoardListView({Key key, this.title, this.boardList}) : super(key: key);

  final String title;
  final BoardList boardList;

  @override
  BoardListViewState createState() => new BoardListViewState();
}

class BoardListViewState extends State<BoardListView> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
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
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      endDrawer: AppDrawer(),
      body: BoardList(initialBoards),
    );
  }

  /***
   * DATA
   * */
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
}

