import 'package:flutter/material.dart';
import 'package:services/widgets/navigation_drawer_widget.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hello"),
        // leading: GestureDetector(
        //     onTap: () {},
        //     child: Icon(
        //       Icons.menu,
        //     )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.notifications_none_outlined),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.people),
            ),
          ),
        ],
      ),
    );
  }
}
