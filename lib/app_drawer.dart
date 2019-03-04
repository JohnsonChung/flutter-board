import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  AppDrawerState createState() => new AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(

        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text(
                  "DRAWER HEADER..",
                  style: TextStyle(color: Theme.of(context).primaryColorLight)),
              decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
              ),
            ),
            new ListTile(
              title: new Text("Item => 1"),
              onTap: () {/* Navigator */},
            ),
            new ListTile(
              title: new Text("Item => 2"),
              onTap: () {/* Navigator */},
            ),
            new ListTile(
              title: Text('Clsoe'),
              onTap: () { Navigator.pop(context); }
            )
          ],
        )
    );
  }
}