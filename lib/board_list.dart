import 'package:flutter/material.dart';

import 'board_card.dart';
import 'package:basic_flutter_app/model/board_model.dart';

class BoardList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<Board> boards;

  BoardList(this.boards);

  @override
  Widget build(BuildContext context) {
    return _gridView(context);
  }

  GridView _gridView(context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: boards.length,
      itemBuilder: (context, int) {
        /// Board Card
        return Align(
          alignment: Alignment.topLeft,
            child: Hero(
                tag: '${boards[int].settings.brandImage}',
                child: BoardCard(boards[int])
            ),
        );
      },
    );
  }
}
