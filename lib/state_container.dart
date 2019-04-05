import 'package:flutter/material.dart';
import 'package:basic_flutter_app/model/board_model.dart';

class User {
  String firstName;
  String lastName;
  String email;

  User(this.firstName, this.lastName, this.email);
}

/// StateContainer
class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;
  final User user;
  final Board board;

  StateContainer({
    @required this.child,
    this.user,
    this.board,
  });

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer).data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

/// State
class StateContainerState extends State<StateContainer> {
  // Whichever properties you wanna pass around your app as state
  User user;
  Board board;

  // You can (and probably will) have methods on your StateContainer
  // These methods are then used through our your app to
  // change state.
  // Using setState() here tells Flutter to repaint all the
  // Widgets in the app that rely on the state you've changed.
  void updateUserInfo({firstName, lastName, email}) {
    if (user == null) {
      user = new User(firstName, lastName, email);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        user.email = email ?? user.email;
      });
    }
  }
  /// 先模仿...
  void updateBoardInfo({key, counter, settings}) {
    if (board == null) {
      board = new Board(key);
      setState(() {
        board = board;
      });
    } else {
      setState(() {
        board.key = key ?? board.key;
        board.counter =  counter ?? board.counter;
        board.settings = settings ?? board.settings;
      });
    }
  }

  // Simple build method that just passes this state through
  // your InheritedWidget
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

/// InheritedWidget
class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final StateContainerState data;

  // You must pass through a child and your state.
  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
