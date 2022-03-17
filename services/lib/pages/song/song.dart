import 'package:flutter/material.dart';
import 'package:services/config/constant.dart';
import 'package:services/pages/song/widgets/menu_items.dart';

class SongScreen extends StatefulWidget {
  SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  bool boolSortBy = true;
  bool boolSortDirection = true;
  bool boolView = false;
  final GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              //title: const Text('Floating Nested SliverAppBar'),
              floating: true,
              //expandedHeight: 150,
              backgroundColor: Colors.white.withOpacity(0),
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 20,
                              ),
                              label: Text('Filter',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black))),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: kSecondaryColor),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("200 Results"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: PopupMenuButton(
                              key: _menuKey,
                              offset: const Offset(0, 50),
                              icon: Icon(
                                Icons.follow_the_signs,
                                size: 20,
                                color: kPrimaryColor,
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem<int>(
                                      enabled: false,
                                      child: itemMenu(
                                          text: "SORT BY", selected: false)),
                                  CheckedPopupMenuItem(
                                      value: 1,
                                      checked: boolSortBy,
                                      child: itemMenu(
                                          text: "Title", selected: boolSortBy)),
                                  PopupMenuItem<int>(
                                      value: 2,
                                      child: itemMenu(
                                          text: "Last Scheduled",
                                          selected: !boolSortBy)),
                                  PopupMenuItem<int>(
                                      enabled: false,
                                      child: itemMenu(
                                          text: "SORT DIRECTION",
                                          selected: false)),
                                  PopupMenuItem<int>(
                                      value: 3,
                                      child: itemMenu(
                                          text: "Ascending",
                                          selected: boolSortDirection)),
                                  PopupMenuItem<int>(
                                      value: 4,
                                      child: itemMenu(
                                          text: "Descending",
                                          selected: !boolSortDirection)),
                                  PopupMenuItem<int>(
                                      enabled: false,
                                      child: itemMenu(
                                          text: "VIEW", selected: false)),
                                  PopupMenuItem<int>(
                                      value: 5,
                                      child: itemMenu(
                                          text: "Last Scheduled Date",
                                          selected: boolView)),
                                ];
                              },
                              onSelected: (value) {
                                switch (value) {
                                  case 1:
                                    setState(() {
                                      boolSortBy = true;
                                    });
                                    dynamic state = _menuKey.currentState;
                                    state.showButtonMenu();
                                    break;
                                  case 2:
                                    setState(() {
                                      boolSortBy = false;
                                      boolSortDirection = false;
                                      boolView = true;
                                    });
                                    dynamic state = _menuKey.currentState;
                                    state.showButtonMenu();
                                    break;
                                  case 3:
                                    setState(() {
                                      boolSortDirection = true;
                                    });
                                    dynamic state = _menuKey.currentState;
                                    state.showButtonMenu();
                                    break;
                                  case 4:
                                    setState(() {
                                      boolSortDirection = false;
                                    });
                                    dynamic state = _menuKey.currentState;
                                    state.showButtonMenu();
                                    break;
                                  case 5:
                                    setState(() {
                                      boolView = !boolView;
                                    });
                                    dynamic state = _menuKey.currentState;
                                    state.showButtonMenu();
                                    break;
                                  default:
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text('Item $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class itemMenu extends StatelessWidget {
  const itemMenu({
    Key? key,
    required this.text,
    required this.selected,
  }) : super(key: key);
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (this.selected)
          Icon(
            Icons.ac_unit_outlined,
            size: 20,
            color: kPrimaryColor,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(this.text),
        ),
      ],
    ));
  }
}
