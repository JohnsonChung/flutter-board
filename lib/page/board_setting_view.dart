import 'package:flutter/material.dart';
import '../state_container.dart';
import 'package:basic_flutter_app/model/board_model.dart';

class BoardSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final container = StateContainer.of(context);
    final board = container.board;

    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]
          ),
          title: Text('Board Settings'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
