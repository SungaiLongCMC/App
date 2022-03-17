import 'package:flutter/material.dart';
import 'package:services/pages/profile/profile.dart';
import 'package:services/pages/song/song.dart';
import 'package:services/widgets/navigation_drawer_widget.dart';

Widget buildAppBarActions({
  required VoidCallback onTap,
  required IconData icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(icon),
  );
}

class AppScreen extends StatefulWidget {
  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int index = 2;

  final appBarTitle = [
    "My Schedule",
    "Sungai Long Chinese Methodist Church",
    "Songs",
    "Media",
    "People",
  ];

  final screens = [
    ProfileScreen(),
    ProfileScreen(),
    SongScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  final appBarActions = [
    buildAppBarActions(onTap: () {}, icon: Icons.notifications_none_outlined),
    buildAppBarActions(onTap: () {}, icon: Icons.share_outlined),
    Container(),
    buildAppBarActions(onTap: () {}, icon: Icons.search_outlined),
    buildAppBarActions(onTap: () {}, icon: Icons.search_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final urlImage =
        'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50';

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(appBarTitle[index]),
        // leading: GestureDetector(
        //     onTap: () {},
        //     child: Icon(
        //       Icons.menu,
        //     )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: appBarActions[index],
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(urlImage),
              ),
            ),
          ),
        ],
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            label: 'Schedule',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Plans',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Songs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outlined),
            label: 'Media',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
