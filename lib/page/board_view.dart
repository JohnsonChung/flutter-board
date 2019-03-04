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

  // TODO:　學習 setState() 的使用方式
  Map popMenuItems = {'harder': 1, 'smarter': 2};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,  bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: false,
                snap: false,
                expandedHeight: 150.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Board View"),
                  background: Hero(
                    tag: '${widget.board.imageSrc}',
                    child: Image.asset(
                        'assets/images/${widget.board.imageSrc}',
                    fit: BoxFit.cover),
                  ),
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        value: '1',
                        child: Text('精華區'),
                      ),
                      const PopupMenuItem(
                        value: '2',
                        child: Text('版面設定'),
                      ),
                    ],
                  ),
                ],
              ),
            ];
          },
          body: Villain(
            animateExit: true,
            villainAnimation: VillainAnimation.fromTop(
              offset: -0.1,
              from: Duration(milliseconds: 0),
              to: Duration(milliseconds: 200),
            ),
            // end Villain setting
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ReplyList(initialReplies),
                )
              ],
            ),
          ),
        ));
  }

  /***
   * DATA
   * */
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
