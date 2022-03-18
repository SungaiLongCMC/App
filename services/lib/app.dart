import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:services/pages/people/people.dart';
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
  const AppScreen({Key? key}) : super(key: key);

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
    const ProfileScreen(),
    const ProfileScreen(),
    SongScreen(),
    const ProfileScreen(),
    PeopleScreen(),
  ];

  final appBarActions = [
    buildAppBarActions(onTap: () {}, icon: Icons.notifications_none_outlined),
    Container(),
    buildAppBarActions(onTap: () {}, icon: Icons.search_outlined),
    buildAppBarActions(onTap: () {}, icon: Icons.search_outlined),
    buildAppBarActions(onTap: () {}, icon: Icons.search_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    const urlImage =
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
            padding: const EdgeInsets.only(right: 20.0),
            child: appBarActions[index],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendarCheck),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.formatListBulleted),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.music),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.playBoxOutline),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
