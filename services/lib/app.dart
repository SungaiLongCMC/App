import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:services/config/route_name.dart';
import 'package:services/pages/error/error.dart';
import 'package:services/pages/media/media.dart';
import 'package:services/pages/people/people.dart';
import 'package:services/pages/plans/plans.dart';
import 'package:services/pages/profile/profile.dart';
import 'package:services/pages/schedule/schedule.dart';
import 'package:services/pages/song/song.dart';
import 'package:services/widgets/navigation_drawer_widget.dart';

GlobalKey<NavigatorState> _pageNavigatorKey = GlobalKey<NavigatorState>();

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
  int _index = 0;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(_handlePageChange);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    super.dispose();
  }

  void _handlePageChange() {
    final newIndex = _pageController.page!.round();

    if (_currentIndex != newIndex) {
      setState(() {
        _currentIndex = newIndex;
      });

      // final hn = context.read<HackerNewsNotifier>();
      // final tabs = hn.tabs;
      // final current = tabs[_currentIndex];

      // if (current.articles.isEmpty && !current.isLoading) {
      //   // New tab with no data. Let's fetch some.
      //   current.refresh();
      // }
    }
  }

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
        title: Text(appBarTitle[_index]),
        // leading: GestureDetector(
        //     onTap: () {},
        //     child: Icon(
        //       Icons.menu,
        //     )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: appBarActions[_index],
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
      body: Navigator(
        initialRoute: '/schedule',
        reportsRouteUpdateToEngine: true,
        key: _pageNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          late Widget page;
          if (settings.name!.startsWith(scheduleRoute)) {
            page = const ScheduleScreen();
          } else if (settings.name!.startsWith(planRoute)) {
            page = const PlansScreen();
          } else if (settings.name!.startsWith(songsRoute)) {
            page = SongScreen();
          } else if (settings.name!.startsWith(mediasRoute)) {
            page = const MediaScreen();
          } else if (settings.name!.startsWith(peopleRoute)) {
            page = PeopleScreen();
          } else {
            page = const ErrorScreen();
          }
          return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return page;
              });
        },
      ),
      // body: NestedScreen(navigatorKey: _navigatorKey()),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _index,
        onTap: (value) {
          // if (index != value) {
          switch (value) {
            case 0:
              _pageNavigatorKey.currentState!.pushNamed("/schedule");
              break;
            case 1:
              _pageNavigatorKey.currentState!.pushNamed("/dashboard/0");
              break;
            case 2:
              _pageNavigatorKey.currentState!.pushReplacementNamed(
                  "/songs?order=title&page=1&per_page=100");
              break;
            case 3:
              _pageNavigatorKey.currentState!.pushReplacementNamed(
                  "/medias?order=title&page=1&per_page=100");
              break;
            case 4:
              _pageNavigatorKey.currentState!.pushReplacementNamed(
                  "/people?page=1&order=first_name&team_id%5B%5D=4154826");
              break;
          }
          setState(() {
            _index = value;
          });
          // }
        },
        // onTap: _onItemTapped,
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
