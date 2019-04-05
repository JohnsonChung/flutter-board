import 'package:flutter/material.dart';
import '../board_list.dart';
import '../model/board_model.dart';
import '../widget/app_drawer.dart';
import '../utils/colors.dart';

class BoardListView extends StatefulWidget {
  BoardListView({Key key, this.title, this.boardList}) : super(key: key);

  final String title;
  final BoardList boardList;

  @override
  BoardListViewState createState() => new BoardListViewState();
}

class BoardListViewState extends State<BoardListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: _silverAppBarChild,
              ),
              title: Text(widget.title),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
              ],
              leading: IconButton(
                icon: const Icon(Icons.filter_none),
                onPressed: () {},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ];
        },
        body: BoardList(initialBoards),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      endDrawer: AppDrawer(),
    );
  }

  var _searchTxt = new TextEditingController();
  Widget get _silverAppBarChild {

    return Center(
      child: Container(
        height: 80.0,
        margin: EdgeInsets.only(top: 80.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: FutabaPalette.primaryLightColor,
        child: TextFormField(
          controller: _searchTxt,
          decoration: InputDecoration(
              hintText: 'Search Content',
              filled: true,
              suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    debugPrint('debug searching: ${_searchTxt.text}');
                  })),
        ),
      ),
    );
  }

  /***
   * DATA
   * */
  List<Board> initialBoards = []
    ..add(Board('B01',
        counter: 10,
        settings: BoardSettings(name: '綜合版', brandImage: 'board_0.jpg')))
    ..add(Board('B02', settings: BoardSettings(brandImage: 'board_1.jpg')))
    ..add(Board('B03', settings: BoardSettings(brandImage: 'board_2.jpg')))
    ..add(Board('B04', settings: BoardSettings(brandImage: 'board_3.jpg')))
    ..add(Board('B05', settings: BoardSettings(brandImage: 'board_4.jpg')))
    ..add(Board('B06', settings: BoardSettings(brandImage: 'board_5.jpg')))
    ..add(Board('B07', settings: BoardSettings(brandImage: 'board_6.jpg')))
    ..add(Board('B08', settings: BoardSettings(brandImage: 'board_7.jpg')))
    ..add(Board('B09', settings: BoardSettings(brandImage: 'board_8.jpg')))
    ..add(Board('k10'));
}
