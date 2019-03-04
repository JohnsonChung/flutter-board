import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';
import 'board_model.dart';
import 'utils/utils.dart';
import 'utils/colors.dart';

class BoardCard extends StatefulWidget {
  final Board board;

  BoardCard(this.board);

  @override
  _BoardCardState createState() => new _BoardCardState();
}

class _BoardCardState extends State<BoardCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: boardCard
    );
  }

  Widget get boardCard{
    // TODO: hero動畫摸索中
    return Material(
      color: FutabaPalette.replyColor,
      child: InkWell(
        onTap: (){ Navigator.pushNamed(context, '/board_view', arguments: widget.board); },
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(widget.board.boardName)
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/${widget.board.imageSrc}'),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('人數：${widget.board.counter}')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}