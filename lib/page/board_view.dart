import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';
import '../board_model.dart';
import '../reply_model.dart';
import '../reply_list.dart';

class BoardView extends StatefulWidget {
  final Board board;

  BoardView(this.board);

  @override
  BoardViewState createState() => new BoardViewState();
}

class BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSizeProxy(
          preferredSizeWidget: new AppBar(
            title: new Text("Board View"),

          ),
          widgetWithChildBuilder: (context, child) {
            // TODO: hero動畫摸索中
            return Villain(
              villainAnimation: VillainAnimation.fromTop(
                offset: 0.5,
                from: Duration(milliseconds: 100),
                to: Duration(milliseconds: 200),
              ),
              child: child,
            );
          },
        ),
        // TODO: hero動畫摸索中
        body: Villain(
          animateExit: true,
          villainAnimation: VillainAnimation.fromTop(
            offset:-0.1,
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 200),
          ),
          // end Villain setting
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // TODO: hero動畫摸索中
                  child:Hero(
                    tag: '${widget.board.imageSrc}',
                    child: Container(
                        height: 250,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage('assets/images/${widget.board.imageSrc}'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  elevation: 0,
                ),
              ),
              ///   ReplyList()
            ],
          ),
        ));
  }
}
