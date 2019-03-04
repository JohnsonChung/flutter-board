import 'package:flutter/material.dart';
import 'package:flutter_villains/villain.dart';

class BoardView extends StatefulWidget {
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
              villainAnimation: VillainAnimation.fromRight(
                offset: 1,
                from: Duration(milliseconds: 100),
                to: Duration(milliseconds: 500),
              ),
              animateExit: true,
              child: child,
            );
          },
        ),
        // TODO: hero動畫摸索中
        body: Villain(
          animateExit: true,
          villainAnimation: VillainAnimation.fromRight(
            offset:1,
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 1000),
          ),
          // end Villain setting
          child: Container(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // TODO: hero動畫摸索中
              child:Hero(
                tag: 'hero',
                child: Container(
                    height: 400,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage('assets/images/board_01.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        ));
  }
}
